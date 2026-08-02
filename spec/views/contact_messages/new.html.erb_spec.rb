# frozen_string_literal: true

# Two things meet in this template. The heading goes into
# content_for(:page_title), which only the application layout yields, and no
# spec may render that layout — the Run tests workflow never builds the
# javascript bundles it includes.
#
# It is also the only form on the public site. SimpleForm marks an invalid
# field `aria-invalid` and then leaves the message beside it unconnected, so
# the field announced as wrong never said what was wrong with it — see
# lib/components/described_by.rb.
RSpec.describe "contact_messages/new", type: :view do
  def render_page(page, message: ContactMessage.new)
    assign(:contact_message, message)
    assign(:page, page)

    render
  end

  # The aria examples care about the form, not the copy above it, so they take
  # a plain contact page — but they still have to assign one, since the
  # template renders its title and body.
  def markup(message)
    render_page(create(:page, :contact), message:)

    Nokogiri::HTML5.fragment(rendered)
  end

  def invalid_message
    ContactMessage.new.tap(&:valid?)
  end

  def described_text(field, form)
    ids = form.css("##{field}").first["aria-describedby"].to_s.split

    ids.map { |id| form.css("##{id}").text.strip }
  end

  it "renders the body of the page above the form" do
    render_page(create(:page, :contact, body: "<p>Escriu-me</p>"))

    expect(rendered.index("Escriu-me")).to be < rendered.index("<form")
  end

  it "renders the body as markup rather than escaping it" do
    render_page(create(:page, :contact, body: "<p>Escriu-me</p>"))

    expect(rendered).to include "<p>Escriu-me</p>"
  end

  it "uses the title of the page as the heading" do
    render_page(create(:page, :contact, title: "Contacte"))

    expect(view.content_for(:page_title)).to include ">Contacte<"
  end

  it "puts the title in the document title too" do
    render_page(create(:page, :contact, title: "Contacte"))

    expect(view.content_for(:title)).to eq "Contacte"
  end

  it "shows the title of the requested locale" do
    page = create(:page, :contact)
    I18n.with_locale(:es) { page.update!(title: "Contacto") }

    I18n.with_locale(:es) { render_page(page) }

    expect(view.content_for(:page_title)).to include "Contacto"
  end

  # Unlike the about page, which has nothing else to describe itself with, this
  # one is a contact form whatever the intro above it happens to say.
  it "describes the page with its own translation rather than the body" do
    render_page(create(:page, :contact, body: "<p>Escriu-me</p>"))

    expect(view.content_for(:meta_description)).to eq I18n.t("meta.descriptions.contact")
  end

  it "still posts the message to the contact messages route" do
    render_page(create(:page, :contact))

    expect(rendered).to include %(action="#{contact_messages_path}")
  end

  it "labels every field" do
    form = markup(ContactMessage.new)

    labelled = form.css("input:not([type=hidden]):not([type=submit]), textarea").map { |field|
      form.css("label[for='#{field['id']}']").any?
    }

    expect(labelled).to all(be true)
  end

  it "points an invalid field at the message that says what is wrong" do
    form = markup(invalid_message)

    expect(described_text("contact_message_from_email", form))
      .to eq [I18n.t("errors.messages.blank")]
  end

  it "describes every field that it also marks invalid" do
    form = markup(invalid_message)

    invalid = form.css("[aria-invalid=true]")

    expect(invalid.pluck("aria-describedby")).to all(be_present)
  end

  it "leaves a valid field undescribed rather than pointing at nothing" do
    form = markup(invalid_message)

    expect(form.css("#contact_message_subject").first["aria-describedby"]).to be_nil
  end

  it "gives every id it points at something to point at" do
    form = markup(invalid_message)

    targets = form.css("[aria-describedby]").flat_map { |f| f["aria-describedby"].split }

    expect(targets.map { |id| form.css("##{id}").any? }).to all(be true)
  end

  it "uses each id once, so the reference is unambiguous" do
    form = markup(invalid_message)

    ids = form.css("[id]").pluck("id")

    expect(ids).to eq ids.uniq
  end

  # An invalid submit comes back as the same page with one paragraph added.
  # Nothing else would tell someone not looking at it that it did not go
  # through.
  it "takes focus to the summary of what went wrong" do
    form = markup(invalid_message)

    expect(form.css("[autofocus]").pluck("class")).to eq ["alert alert-error"]
  end

  it "makes that summary focusable without putting it in the tab order" do
    form = markup(invalid_message)

    expect(form.css(".alert").first["tabindex"]).to eq "-1"
  end

  it "has nothing to take focus to when there is nothing wrong" do
    expect(markup(ContactMessage.new).css("[autofocus]")).to be_empty
  end
end
