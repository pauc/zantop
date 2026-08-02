# frozen_string_literal: true

# A work's extra sections are a title and a body, and the title is optional.
RSpec.describe "sections/_section", type: :view do
  def markup(section)
    render partial: "sections/section", locals: { section: }

    Nokogiri::HTML5.fragment(rendered)
  end

  it "heads a section that has a title" do
    section = build(:section, title: "El procés", body: "<p>Text</p>")

    expect(markup(section).css("h2").map(&:text)).to eq ["El procés"]
  end

  # It used to render `<h2></h2>` regardless. A heading with no name is not a
  # heading a screen reader can skip past — it is a hole in the outline.
  it "heads nothing when the section has no title" do
    section = build(:section, title: nil, body: "<p>Text</p>")

    expect(markup(section).css("h2")).to be_empty
  end

  it "leaves out the wrapper the heading sat in too" do
    section = build(:section, title: nil, body: "<p>Text</p>")

    expect(markup(section).css(".section-title")).to be_empty
  end

  it "still renders the body of an untitled section" do
    section = build(:section, title: nil, body: "<p>Només text</p>")

    expect(markup(section).css(".section-body").text).to include "Només text"
  end
end
