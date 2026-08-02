# frozen_string_literal: true

# The front page is this partial repeated and nothing else, so whatever it
# leaves out is what the site's own index leaves out.
RSpec.describe "dashboards/_works", type: :view do
  def markup(works)
    render partial: "dashboards/works", locals: { works: }

    Nokogiri::HTML5.fragment(rendered)
  end

  # What a screen reader would announce: a link holding nothing but a picture
  # is named by that picture, and by nothing else — whether the picture is an
  # `img` with an alt or the element standing in for one a work has no file of.
  def link_names(fragment)
    fragment.css("a").map do |link|
      pictures = link.css("img, [role=img]").map { |image| image["alt"] || image["aria-label"] }

      link["aria-label"].presence || pictures.join(" ").presence || link.text.strip
    end
  end

  it "names each thumbnail after the work it leads to" do
    work = create(:visual_work, title: "Paisatge líquid", images: [build(:image)])

    expect(markup([work]).css("img").first["alt"]).to eq "Paisatge líquid"
  end

  # This branch used to render an icon that is in no assets directory, so it
  # raised before it could be looked at — and, rendered inside the loop that is
  # the whole front page, took every other work down with it.
  it "stands in for a work whose first item is a video" do
    work = create(:action_work, title: "Deriva", images: [build(:image, :video)])

    stand_in = markup([work]).css("a.work-preview .work-preview-video").first

    expect(stand_in.text.strip).to eq "▶"
    expect(stand_in["aria-label"]).to eq "Deriva"
  end

  it "names the placeholder that stands in for a work with nothing at all" do
    work = create(:action_work, title: "Sense imatge")

    expect(markup([work]).css("img").first["alt"]).to eq "Sense imatge"
  end

  # The page went from the logo's h1 straight to the footer's heading, with the
  # twelve works in between reachable only by reading through them.
  it "heads each work with its title" do
    works = [create(:visual_work, title: "Phoscenes"), create(:action_work, title: "Fluxus")]

    expect(markup(works).css("h2.work-title").map { |heading| heading.text.strip })
      .to eq %w[Phoscenes Fluxus]
  end

  # All three branches of `preview_image` at once, since a page of works mixes
  # them and it is the loop that makes one bad branch everyone's problem.
  it "leaves no link on the page without a name" do
    works = [create(:visual_work, title: "Phoscenes", images: [build(:image)]),
             create(:action_work, title: "Deriva", images: [build(:image, :video)]),
             create(:action_work, title: "Sense imatge")]

    expect(link_names(markup(works))).to all(be_present)
  end
end
