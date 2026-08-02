# frozen_string_literal: true

RSpec.describe "works/_gallery", type: :view do
  def render_gallery(images)
    render partial: "works/gallery", locals: { images: }

    rendered
  end

  def image_with(credits: nil, work: create(:action_work))
    create(:image, work:).tap do |image|
      image.update!(credits:) if credits
    end
  end

  describe "the images" do
    it "leads with a large variant of every image" do
      images = [image_with, image_with]

      expect(render_gallery(images))
        .to include(polymorphic_path(images.first.image.variant(:large)))
        .and include(polymorphic_path(images.second.image.variant(:large)))
    end

    it "blows each one up to the full variant in the lightbox" do
      image = image_with

      expect(render_gallery([image])).to include polymorphic_path(image.image.variant(:full))
    end

    it "thumbnails with the card variant, which is the smallest that fits a strip" do
      image = image_with

      expect(render_gallery([image, image_with]))
        .to include polymorphic_path(image.image.variant(:card))
    end

    # The lead is the largest thing on the page and the only one visible before
    # a scroll, so it is the one image worth blocking the render for.
    it "loads the first lead eagerly" do
      expect(render_gallery([image_with, image_with]))
        .to match(/data-gallery-lead="0".*?loading="eager"/m)
    end

    it "leaves the leads after it to load lazily" do
      expect(render_gallery([image_with, image_with]))
        .to match(/data-gallery-lead="1".*?loading="lazy"/m)
    end
  end

  describe "a single image" do
    it "opens the lightbox on the one image it has" do
      expect(render_gallery([image_with])).to include %(data-gallery-open="0")
    end

    # Nothing to pick between, so the strip, the filmstrip, the counter and the
    # arrows would all only ever point back at the image already on screen.
    it "has no strip of thumbnails to choose from" do
      expect(render_gallery([image_with])).not_to include "data-gallery-select"
    end

    it "has no filmstrip in the lightbox" do
      expect(render_gallery([image_with])).not_to include "data-gallery-jump"
    end

    it "has no counter" do
      expect(render_gallery([image_with])).not_to include "data-gallery-counter"
    end

    it "has no previous arrow" do
      expect(render_gallery([image_with])).not_to include "data-gallery-prev"
    end

    it "has no next arrow" do
      expect(render_gallery([image_with])).not_to include "data-gallery-next"
    end

    it "can still be closed" do
      expect(render_gallery([image_with])).to include "data-gallery-close"
    end
  end

  describe "several images" do
    let(:images) { Array.new(3) { image_with } }

    it "gives the strip a thumbnail per image" do
      expect(render_gallery(images).scan("data-gallery-select=").size).to eq 3
    end

    it "gives the filmstrip a thumbnail per image" do
      expect(render_gallery(images).scan("data-gallery-jump=").size).to eq 3
    end

    it "gives the lightbox a slide per image" do
      expect(render_gallery(images).scan("data-gallery-slide=").size).to eq 3
    end

    it "numbers the strip from zero, as the script indexes it" do
      expect(render_gallery(images))
        .to include(%(data-gallery-select="0")).and include(%(data-gallery-select="2"))
    end

    it "offers the arrows and the counter" do
      expect(render_gallery(images))
        .to include("data-gallery-prev").and include("data-gallery-counter")
    end
  end

  describe "a video" do
    let(:video) { create(:image, :video, video: "https://vimeo.com/76979871") }

    it "links out to where the video actually lives" do
      expect(render_gallery([video])).to include %(href="https://vimeo.com/76979871")
    end

    it "opens it in a new tab, since it leaves the site" do
      expect(render_gallery([video])).to include %(target="_blank")
    end

    it "does not hand the opener over with the tab" do
      expect(render_gallery([video])).to include %(rel="noopener")
    end

    it "says what the link is for" do
      expect(render_gallery([video])).to include I18n.t("works.labels.watch_video")
    end

    # There is no frame to show, so the strip gets a placeholder in its place.
    it "stands in for the missing thumbnail" do
      expect(render_gallery([video, image_with])).to include "gallery-video-thumb"
    end

    it "has nothing to blow up full screen" do
      expect(render_gallery([video])).not_to include "data-gallery-open"
    end

    it "still takes its turn in the strip" do
      expect(render_gallery([video, image_with]).scan("data-gallery-select=").size).to eq 2
    end
  end

  describe "the credits" do
    it "captions the lead with them" do
      expect(render_gallery([image_with(credits: "Foto: Ferran Zantop")]))
        .to include "Foto: Ferran Zantop"
    end

    it "captions the lightbox slide with them too" do
      rendered = render_gallery([image_with(credits: "Foto: Ferran Zantop")])

      expect(rendered.scan("Foto: Ferran Zantop").size).to eq 2
    end

    it "captions a video with them" do
      video = create(:image, :video)
      video.update!(credits: "Vídeo: Ferran Zantop")

      expect(render_gallery([video])).to include "Vídeo: Ferran Zantop"
    end

    # The lead keeps an empty caption to reserve the space, so that images with
    # and without credits do not shove the strip below them up and down.
    it "keeps the lead's caption box on an image with none" do
      expect(render_gallery([image_with])).to include "gallery-caption"
    end

    it "leaves the lightbox slide without one" do
      rendered = render_gallery([image_with])

      expect(rendered.scan("gallery-caption").size).to eq 1
    end

    # Credits are plain text, not rich text: the caption carries the newlines
    # through and the stylesheet renders them, rather than the editor wrapping
    # each line in markup.
    it "captions with the credits as text, with no markup of their own" do
      rendered = render_gallery([image_with(credits: "Foto: Ester Xargay")])

      expect(rendered).to include ">Foto: Ester Xargay<"
    end

    it "keeps the line breaks of a multi-line credit" do
      rendered = render_gallery([image_with(credits: "Alguien camina\nsin dejar huella")])

      expect(rendered).to include "Alguien camina\nsin dejar huella"
    end

    it "escapes markup typed into them rather than rendering it" do
      rendered = render_gallery([image_with(credits: "<strong>Atadalasalas</strong>")])

      expect(rendered).to include "&lt;strong&gt;Atadalasalas"
      expect(rendered).not_to include "<strong>Atadalasalas"
    end
  end

  # The site stores no description of any picture, so the text alternative is
  # positional rather than descriptive: the images say nothing and the controls
  # around them say which one of how many they are. That is enough to reach,
  # count and work every one of them, and it invents nothing.
  describe "the names a screen reader has to work with" do
    def markup(images)
      Nokogiri::HTML5.fragment(render_gallery(images))
    end

    it "names each thumbnail in the strip by its place in the run" do
      names = markup(Array.new(3) { image_with }).css("[data-gallery-select]")

      expect(names.pluck("aria-label"))
        .to eq ["Imatge 1 de 3", "Imatge 2 de 3", "Imatge 3 de 3"]
    end

    it "names the filmstrip's thumbnails the same way" do
      names = markup(Array.new(2) { image_with }).css("[data-gallery-jump]")

      expect(names.pluck("aria-label"))
        .to eq ["Imatge 1 de 2", "Imatge 2 de 2"]
    end

    # A video's thumbnail is a play glyph marked aria-hidden, so before this
    # the button around it was empty — not merely vague, silent.
    it "says a video thumbnail is a video" do
      video = create(:image, :video)

      expect(markup([video, image_with]).css("[data-gallery-select]").first["aria-label"])
        .to eq "Vídeo 1 de 2"
    end

    it "says what opening a lead does, and to which image" do
      expect(markup([image_with, image_with]).css("[data-gallery-open]").last["aria-label"])
        .to eq "Ampliar la imatge 2 de 2"
    end

    it "leaves the pictures themselves silent, since their control speaks" do
      alts = markup(Array.new(2) { image_with }).css("img").pluck("alt")

      expect(alts).to all(eq "")
    end

    it "gives the lightbox a name, so it is not an unnamed dialog" do
      expect(markup([image_with]).css("dialog").first["aria-label"])
        .to eq I18n.t("works.gallery.lightbox")
    end

    # It takes a tab stop of its own — the arrow keys scroll it — and a focus
    # stop with no name is a focus stop with nothing to announce.
    it "names the lead track it makes focusable" do
      track = markup([image_with]).css("[data-gallery-lead-track]").first

      expect(track["aria-label"]).to eq I18n.t("works.gallery.images")
      expect(track["role"]).to eq "group"
    end

    # `showModal` otherwise lands on the first thing it finds focusable, which
    # in Chrome is the scroll container holding the slides.
    it "opens the lightbox on its close button" do
      expect(markup([image_with]).css("[autofocus]").pluck("class"))
        .to eq ["gallery-close"]
    end
  end
end
