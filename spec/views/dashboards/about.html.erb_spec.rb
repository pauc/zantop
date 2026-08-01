# frozen_string_literal: true

# The heading goes into content_for(:page_title), which only the application
# layout yields, and no spec may render that layout — the Run tests workflow
# never builds the javascript bundles it includes.
RSpec.describe "dashboards/about" do
  it "renders the body of the page" do
    assign(:page, create(:page, body: "<p>Zigzagueja en l'u</p>"))

    render

    expect(rendered).to include "Zigzagueja en l'u"
  end

  it "renders the body as markup rather than escaping it" do
    assign(:page, create(:page, body: "<p>Zigzagueja</p>"))

    render

    expect(rendered).to include "<p>Zigzagueja</p>"
  end

  it "uses the title of the page as the heading" do
    assign(:page, create(:page, title: "Bio"))

    render

    expect(view.content_for(:page_title)).to include ">Bio<"
  end

  it "renders a single heading" do
    assign(:page, create(:page, title: "Bio"))

    render

    expect(rendered.scan("<h1").size).to eq 0
  end

  it "puts the title in the document title too" do
    assign(:page, create(:page, title: "Bio"))

    render

    expect(view.content_for(:title)).to eq "Bio | "
  end

  it "shows the title of the requested locale" do
    page = create(:page)
    I18n.with_locale(:es) { page.update!(title: "Biografía") }
    assign(:page, page)

    I18n.with_locale(:es) { render }

    expect(view.content_for(:page_title)).to include "Biografía"
  end
end
