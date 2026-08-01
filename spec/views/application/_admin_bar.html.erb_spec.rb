# frozen_string_literal: true

# The bar is the only way into the page editor, so it is worth pinning down
# here rather than through the layout, which no spec may render.
RSpec.describe "application/_admin_bar" do
  it "links to the about page editor" do
    render

    expect(rendered).to include %(href="/ca/pagines/#{Page::ABOUT_ID}/edit")
  end

  it "links to the contact page editor" do
    render

    expect(rendered).to include %(href="/ca/pagines/#{Page::CONTACT_ID}/edit")
  end

  it "keeps the page editor links on the requested locale" do
    I18n.with_locale(:es) { render }

    expect(rendered).to include %(href="/es/paginas/#{Page::ABOUT_ID}/edit")
  end
end
