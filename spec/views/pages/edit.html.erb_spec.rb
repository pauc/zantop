# frozen_string_literal: true

# A view spec rather than render_views on the controller: the application
# layout calls javascript_include_tag and the Run tests workflow never builds
# the bundles, so anything rendering the layout fails on the pull request.
RSpec.describe "pages/edit" do
  it "points the form at the page" do
    page = create(:page)
    assign(:page, page)

    render

    expect(rendered).to include %(action="/ca/pagines/#{page.id}")
  end

  it "submits the form as a PATCH" do
    assign(:page, create(:page))

    render

    expect(rendered).to include %(name="_method" value="patch")
  end

  it "renders a title field" do
    assign(:page, create(:page))

    render

    expect(rendered).to include %(name="page[title]")
  end

  it "fills the title field with the stored title" do
    assign(:page, create(:page, title: "Bio"))

    render

    expect(rendered).to include %(value="Bio")
  end

  it "edits the body with a trix editor rather than a plain textarea" do
    assign(:page, create(:page))

    render

    expect(rendered).to include "<trix-editor"
  end

  it "renders a body field" do
    assign(:page, create(:page))

    render

    expect(rendered).to include %(name="page[body]")
  end

  it "fills the body field with the stored body" do
    assign(:page, create(:page, body: "<p>Zigzagueja</p>"))

    render

    expect(rendered).to include "Zigzagueja"
  end

  it "names the page being edited in the heading" do
    assign(:page, create(:page, title: "Bio"))

    render

    expect(view.content_for(:page_title)).to include "Editar <span>Bio</span>"
  end

  it "offers a way back through the admin bar" do
    assign(:page, create(:page))

    render

    expect(view.content_for(:admin_bar_second_row)).to include "Tornar"
  end

  it "keeps the form on the requested locale" do
    page = create(:page)
    assign(:page, page)

    I18n.with_locale(:es) { render }

    expect(rendered).to include %(action="/es/paginas/#{page.id}")
  end

  it "edits the translation of the requested locale" do
    page = create(:page)
    I18n.with_locale(:es) { page.update!(title: "Biografía") }
    assign(:page, page)

    I18n.with_locale(:es) { render }

    expect(rendered).to include %(value="Biografía")
  end
end
