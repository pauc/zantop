# frozen_string_literal: true

# Both index actions render this one template, and both the heading and the
# description are looked up by the controller's name. A spec rather than a
# glance at the file because a missing key renders a translation-missing span
# instead of failing. The layout is what would show either, and no spec may
# render it — the Run tests workflow never builds the javascript bundles.
RSpec.describe "works/works_list", type: :view do
  # Both lookups go through `controller.controller_name`, which the bare test
  # controller answers with its own name however the path parameters read.
  def render_list(name)
    controller.request.path_parameters.merge!(controller: name, action: "index", locale: "ca")
    controller.define_singleton_method(:controller_name) { name }
    assign(:published_works, [])

    render
  end

  it "titles the visual works index" do
    render_list("visual_works")

    expect(view.content_for(:title)).to eq "Art visual"
  end

  it "titles the action works index" do
    render_list("action_works")

    expect(view.content_for(:title)).to eq "Art d'acció"
  end

  it "describes each index with its own description" do
    render_list("visual_works")

    expect(view.content_for(:meta_description))
      .to eq I18n.t("meta.descriptions.visual_works")
  end

  it "gives the two indexes different descriptions" do
    render_list("action_works")

    expect(view.content_for(:meta_description))
      .to eq I18n.t("meta.descriptions.action_works")
  end

  # The segment is translated, so the alternates cannot be the current path
  # with a different prefix on it.
  it "offers each locale the index under its own path segment" do
    render_list("visual_works")

    expect(view.content_for(:meta_alternates))
      .to include %(hreflang="es" href="http://test.host/es/arte-visual")
  end
end
