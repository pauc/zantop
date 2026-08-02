# frozen_string_literal: true

# The heading goes into content_for(:page_title), which only the application
# layout yields, and no spec may render that layout — the Run tests workflow
# never builds the javascript bundles it includes.
RSpec.describe "dashboards/contact" do
  def render_page(page)
    assign(:page, page)

    render
  end

  def markup(page = create(:page, :contact))
    render_page(page)

    Nokogiri::HTML5.fragment(rendered)
  end

  it "renders the body of the page above the address" do
    render_page(create(:page, :contact, body: "<p>Escriu-me</p>"))

    expect(rendered.index("Escriu-me")).to be < rendered.index("mailto:")
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
  # one is where you find the address whatever the intro above it happens to
  # say.
  it "describes the page with its own translation rather than the body" do
    render_page(create(:page, :contact, body: "<p>Escriu-me</p>"))

    expect(view.content_for(:meta_description)).to eq I18n.t("meta.descriptions.contact")
  end

  describe "the address" do
    # The whole point of the line: an admin is free to rewrite the intro into
    # something that names no way of getting in touch, and the page still does.
    it "is there when the intro says nothing" do
      link = markup(create(:page, :contact, body: "<p>Hola</p>")).css("a[href^='mailto:']")

      expect(link.first["href"]).to eq "mailto:hola@mireiazantop.com"
    end

    it "reads as the address rather than as a bare link" do
      expect(markup.css(".mailbox").text.strip).to eq "Em pots escriure a hola@mireiazantop.com"
    end

    it "is a link rather than escaped markup in the sentence around it" do
      expect(markup.css(".mailbox a").text).to eq "hola@mireiazantop.com"
    end

    it "says it in the requested locale" do
      I18n.with_locale(:en) { markup }

      expect(rendered).to include "You can contact me at"
    end
  end
end
