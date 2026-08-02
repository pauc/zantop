# frozen_string_literal: true

# A view spec rather than render_views on the controller: the application
# layout calls javascript_include_tag and the Run tests workflow never builds
# the bundles, so anything that renders the layout passes locally and fails on
# the pull request.
RSpec.describe "users/edit", type: :view do
  # The action has to be named because SimpleForm scopes its hints by it —
  # `hints.user.edit.password` — and a view spec leaves `action_name` blank,
  # which no request ever does. `UsersController` renders this template from
  # `edit` and again from `update` when the save fails.
  def render_for(user, action: "edit")
    controller.action_name = action
    assign(:user, user)

    render

    Nokogiri::HTML5.fragment(rendered)
  end

  it "names the user in the title" do
    render_for create(:user, name: "Mireia")

    expect(view.content_for(:page_title)).to include "Mireia"
  end

  it "submits to the singular user route, which carries no id" do
    render_for create(:user)

    expect(rendered).to include %(action="#{user_path}")
  end

  it "updates rather than creates" do
    render_for create(:user)

    expect(rendered).to include %(name="_method" value="patch")
  end

  it "asks for the new password twice" do
    render_for create(:user)

    expect(rendered.scan(/name="user\[password[^"]*\]"/))
      .to eq ['name="user[password]"', 'name="user[password_confirmation]"']
  end

  it "masks both password fields" do
    render_for create(:user)

    expect(rendered.scan('type="password"').size).to eq 2
  end

  it "leaves the password optional, since blank keeps the current one" do
    render_for create(:user)

    expect(rendered).not_to include %(<input required="required" type="password")
  end

  it "keeps the name and the email editable alongside the password" do
    render_for create(:user, name: "Mireia", email: "mireia@example.com")

    expect(rendered).to include %(value="Mireia"), %(value="mireia@example.com")
  end

  it "stays on the requested locale" do
    user = create(:user)

    I18n.with_locale(:es) { render_for user }

    expect(rendered).to include %(action="/es/usuario")
  end

  # The form's own comment says a blank password leaves the current one in
  # place, and the locale files have said so to the admin since the form was
  # written — under `hints.users.edit`, which SimpleForm never asks for. It
  # builds the scope from the object name, so the key is `hints.user.edit`,
  # and until that rename the note had never once reached the page.
  #
  # Asserted against the rendered markup rather than `I18n.exists?`: the
  # missing hint resolved perfectly well as a key, and still rendered nothing.
  describe "the note about leaving the password blank" do
    it "appears beside both password fields" do
      form = render_for create(:user)

      expect(form.css("p.help-block").map(&:text))
        .to eq [I18n.t("simple_form.hints.user.edit.password")] * 2
    end

    # `described_hint` gives the note an id and points the field at it, so a
    # screen reader reads it out with the field rather than skipping it. That
    # only happens once there is a note to give an id to.
    it "is announced with the field it belongs to" do
      form = render_for create(:user)

      %w[password password_confirmation].each do |field|
        described = form.css("#user_#{field}").first["aria-describedby"]

        expect(form.css("##{described}").text)
          .to eq I18n.t("simple_form.hints.user.edit.#{field}")
      end
    end

    # SimpleForm reads `update` as `edit`, so the note survives the round trip
    # through a failed save — which is the one time the admin is looking at
    # this form because something went wrong with the password.
    it "appears again when a failed update re-renders the form" do
      form = render_for create(:user), action: "update"

      expect(form.css("p.help-block").map(&:text))
        .to eq [I18n.t("simple_form.hints.user.edit.password")] * 2
    end

    # One rename per locale file, so one assertion per locale file.
    %i[ca es en].each do |locale|
      it "is written in #{locale}" do
        user = create(:user)

        form = I18n.with_locale(locale) { render_for user }

        expect(form.css("p.help-block").first.text)
          .to eq I18n.t("simple_form.hints.user.edit.password", locale:)
      end
    end
  end
end
