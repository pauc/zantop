# frozen_string_literal: true

# One work on an index page: a picture, a title and a "view more", all three
# linking to the same place. Rails 8.1 derives no `alt` from a filename any
# more, so the picture used to be a link a screen reader read out as a URL.
RSpec.describe "works/_work_preview", type: :view do
  def markup(work)
    render partial: "works/work_preview", locals: { work: }

    Nokogiri::HTML5.fragment(rendered)
  end

  # What a screen reader would announce: a link holding nothing but a picture
  # is named by that picture's alt, and by nothing else.
  def link_names(fragment)
    fragment.css("a").map do |link|
      link["aria-label"].presence || link.css("img").map { |img| img["alt"] }.join(" ").presence ||
        link.text.strip
    end
  end

  it "names the thumbnail after the work it leads to" do
    work = create(:visual_work, title: "Paisatge líquid", images: [build(:image)])

    expect(markup(work).css(".image-container img").first["alt"]).to eq "Paisatge líquid"
  end

  # The placeholder is the whole of the link on a work with no picture yet, so
  # it is the only thing there is to name that link with.
  it "names the placeholder that stands in for a missing picture" do
    work = create(:visual_work, title: "Sense imatge")

    expect(markup(work).css(".image-container img").first["alt"]).to eq "Sense imatge"
  end

  it "leaves no link in the preview without a name" do
    work = create(:visual_work, title: "Paisatge líquid", images: [build(:image)])

    expect(link_names(markup(work))).to all(be_present)
  end

  # "Veure més →" says nothing about which work, and the arrow is read out as
  # a character. Naming the link says both, and replaces the arrow.
  it "says which work the view-more link leads to" do
    work = create(:action_work, title: "Fluxus")

    expect(markup(work).css(".view-more a").first["aria-label"])
      .to eq I18n.t("view_more_about", work: "Fluxus")
  end

  it "keeps the visible text it has always had" do
    work = create(:action_work, title: "Fluxus")

    expect(markup(work).css(".view-more a").first.text).to include I18n.t("view_more")
  end

  it "heads the preview with the work's title" do
    work = create(:action_work, title: "Fluxus")

    expect(markup(work).css("h2.work-title").text.strip).to eq "Fluxus"
  end
end
