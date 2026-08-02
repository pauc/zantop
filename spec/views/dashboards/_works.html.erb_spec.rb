# frozen_string_literal: true

# The front page is this partial repeated and nothing else, so whatever it
# leaves out is what the site's own index leaves out.
RSpec.describe "dashboards/_works", type: :view do
  def markup(works)
    render partial: "dashboards/works", locals: { works: }

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

  it "names each thumbnail after the work it leads to" do
    work = create(:visual_work, title: "Paisatge líquid", images: [build(:image)])

    expect(markup([work]).css("img").first["alt"]).to eq "Paisatge líquid"
  end

  # The third branch of `preview_image`, a work whose first item is a video,
  # has no spec: it renders an icon that is in no assets directory and raises
  # before it can be looked at. Filed as todo 54, not fixed here.
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

  it "leaves no link on the page without a name" do
    work = create(:visual_work, title: "Phoscenes", images: [build(:image)])

    expect(link_names(markup([work]))).to all(be_present)
  end
end
