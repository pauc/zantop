# frozen_string_literal: true

# The heading goes into content_for(:page_title), which only the application
# layout yields, and no spec may render that layout — the Run tests workflow
# never builds the javascript bundles it includes.
RSpec.describe "contact_messages/new" do
  def render_page(page)
    assign(:contact_message, ContactMessage.new)
    assign(:page, page)

    render
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
end
