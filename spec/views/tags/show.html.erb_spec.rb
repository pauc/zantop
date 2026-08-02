# frozen_string_literal: true

# The heading and the metadata both go into content_for, which only the
# application layout yields, and no spec may render that layout — the Run tests
# workflow never builds the javascript bundles it includes.
RSpec.describe "tags/show", type: :view do
  # The template's fragment cache keys on `current_user?`, since the owner is
  # served her unpublished works and the internet is not. It is a controller
  # `helper_method`, which a view spec's view does not inherit, so define it
  # rather than stub it — a double would fail verification against a method
  # that genuinely is not there.
  before { view.define_singleton_method(:current_user?) { false } }

  def render_category(category, locale: "ca")
    controller.request.path_parameters.merge!(controller: "tags",
                                              action: "show",
                                              locale:,
                                              id: category.to_param)
    assign(:category, category)
    assign(:published_works, [])

    render
  end

  it "titles the document with the category" do
    render_category(create(:tag, name: "pintura"))

    expect(view.content_for(:title)).to eq "Pintura"
  end

  it "describes the listing by naming the category" do
    render_category(create(:tag, name: "pintura"))

    expect(view.content_for(:meta_description))
      .to eq I18n.t("meta.descriptions.tag", category: "pintura")
  end

  # A tag's name is translated and so, through friendly_id, is its slug: the
  # English listing lives at /en/tags/paintings, not at /en/tags/pintura.
  it "offers the other locales the listing under their own slug" do
    category = create(:tag, name: "pintura")
    I18n.with_locale(:en) { category.update!(name: "paintings") }

    render_category(category)

    expect(view.content_for(:meta_alternates))
      .to include %(hreflang="en" href="http://test.host/en/tags/paintings")
  end

  it "points the canonical at the slug of the locale being rendered" do
    category = create(:tag, name: "pintura")
    I18n.with_locale(:en) { category.update!(name: "paintings") }

    I18n.with_locale(:en) { render_category(category, locale: "en") }

    expect(view.content_for(:meta_canonical)).to eq "http://test.host/en/tags/paintings"
  end
end
