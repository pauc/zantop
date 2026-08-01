# frozen_string_literal: true

# A view spec rather than render_views on the controller: the application
# layout calls javascript_include_tag and the Run tests workflow never builds
# the bundles, so anything that renders the layout passes locally and fails on
# the pull request.
RSpec.describe "users/edit", type: :view do
  def render_for(user)
    assign(:user, user)

    render
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
end
