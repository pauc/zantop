# frozen_string_literal: true

RSpec.describe Image do
  describe "#type" do
    it "is \"image\" when an image is attached" do
      expect(build(:image).type).to eq "image"
    end

    it "is \"video\" when only a video url is set" do
      expect(build(:image, :video).type).to eq "video"
    end

    it "is nil when neither an image nor a video is set" do
      expect(build(:image, :empty).type).to be_nil
    end

    it "is nil when the video url is blank" do
      expect(build(:image, :empty, video: "").type).to be_nil
    end

    it "prefers the image when both are set" do
      expect(build(:image, video: "https://vimeo.com/76979871").type).to eq "image"
    end
  end

  describe "#image_xor_video" do
    it "accepts an attached image on its own" do
      expect(build(:image)).to be_valid
    end

    it "accepts a video url on its own" do
      expect(build(:image, :video)).to be_valid
    end

    it "rejects an image that has both an attachment and a video url" do
      image = build(:image, video: "https://vimeo.com/76979871")

      expect(image).not_to be_valid
      expect(image.errors[:image]).to eq ["Només imatge o video, no tots dos"]
      expect(image.errors[:video]).to eq ["Només imatge o video, no tots dos"]
    end

    it "rejects an image that has neither an attachment nor a video url" do
      image = build(:image, :empty)

      expect(image).not_to be_valid
      expect(image.errors[:image]).to eq ["Has d'indicar una imatge o vídeo"]
      expect(image.errors[:video]).to eq ["Has d'indicar una imatge o vídeo"]
    end

    it "treats a blank video url as no video" do
      image = build(:image, video: "")

      expect(image).to be_valid
    end

    it "does not report both errors at once" do
      image = build(:image, video: "https://vimeo.com/76979871")
      image.valid?

      expect(image.errors[:image].size).to eq 1
    end
  end

  describe "associations" do
    it "requires a work" do
      expect(build(:image, work: nil)).not_to be_valid
    end
  end

  describe "variants" do
    let(:named_variants) { described_class.reflect_on_attachment(:image).named_variants }

    it "declares the variants used by the gallery" do
      expect(named_variants.keys).to eq [:thumb, :medium, :card, :large, :full]
    end

    it "sizes the thumb variant to fit 100x100" do
      expect(named_variants[:thumb].transformations).to eq(resize_to_fit: [100, 100])
    end

    it "sizes the medium variant to fill 400x400" do
      expect(named_variants[:medium].transformations).to eq(resize_to_fill: [400, 400])
    end

    it "sizes the card variant to fit 500x500" do
      expect(named_variants[:card].transformations).to eq(resize_to_fit: [500, 500])
    end

    it "sizes the large variant to fit 1000x1000" do
      expect(named_variants[:large].transformations).to eq(resize_to_fit: [1000, 1000])
    end

    it "sizes the full variant to fit 2000x2000" do
      expect(named_variants[:full].transformations).to eq(resize_to_fit: [2000, 2000])
    end

    it "processes a variant into a real image" do
      image = create(:image)

      expect(image.image.variant(:thumb).processed).to be_present
    end
  end

  describe "translations" do
    it "translates the credits per locale" do
      image = create(:image)

      I18n.with_locale(:ca) { image.credits = "Foto de la Mireia" }
      I18n.with_locale(:en) { image.credits = "Photo by Mireia" }
      image.save!

      expect(I18n.with_locale(:ca) { image.reload.credits }).to eq "Foto de la Mireia"
      expect(I18n.with_locale(:en) { image.reload.credits }).to eq "Photo by Mireia"
    end
  end

  # Plain rather than rich, so the value comes back as a String and reaches the
  # figcaption escaped. The line breaks the poems among the credits are written
  # with survive as newlines, which the caption renders with white-space.
  describe "credits" do
    it "reads back as a plain string" do
      image = create(:image)

      image.update!(credits: "Foto: Ferran Zantop")

      expect(image.reload.credits).to be_a(String).and eq "Foto: Ferran Zantop"
    end

    it "keeps the line breaks of a multi-line credit" do
      image = create(:image)

      image.update!(credits: "Ya no hay horizonte.\nAlguien camina")

      expect(image.reload.credits).to eq "Ya no hay horizonte.\nAlguien camina"
    end

    it "stores markup as the literal text it is, rather than as markup" do
      image = create(:image)

      image.update!(credits: "<strong>Atadalasalas</strong>")

      expect(image.reload.credits).to eq "<strong>Atadalasalas</strong>"
    end

    # Browsers submit a textarea with CRLF line endings, which would otherwise
    # leave form-typed credits differing from the ones migrated out of rich text
    # by an invisible carriage return.
    it "normalises the CRLF line endings a form submits" do
      image = create(:image)

      image.update!(credits: "Foto: Ferran\r\nSegona linia")

      expect(image.reload.credits).to eq "Foto: Ferran\nSegona linia"
    end

    it "normalises them in every locale, not only the current one" do
      image = create(:image)

      I18n.with_locale(:en) { image.update!(credits: "Photo\r\nSecond line") }

      expect(I18n.with_locale(:en) { image.reload.credits }).to eq "Photo\nSecond line"
    end

    it "still accepts no credits at all" do
      image = create(:image)

      image.update!(credits: nil)

      expect(image.reload.credits).to be_nil
    end
  end
end
