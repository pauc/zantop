# frozen_string_literal: true

RSpec.describe GalleriesHelper do
  describe "#variant_dimensions" do
    # Only the blob's metadata is read, so it is set rather than analysed: the
    # one fixture is square, and a square cannot show an aspect ratio holding.
    def image_sized(width, height)
      create(:image).tap do |image|
        image.image.blob.update!(metadata: { width:, height: }.compact)
      end
    end

    it "scales the long edge down to the limit" do
      expect(helper.variant_dimensions(image_sized(1200, 800), 500)).to eq [500, 333]
    end

    it "scales by the long edge whichever one it is" do
      expect(helper.variant_dimensions(image_sized(800, 1200), 500)).to eq [333, 500]
    end

    it "leaves an image smaller than the limit alone" do
      expect(helper.variant_dimensions(image_sized(300, 200), 500)).to eq [300, 200]
    end

    it "is nil for both when the blob was never analysed" do
      expect(helper.variant_dimensions(image_sized(nil, nil), 500)).to eq [nil, nil]
    end

    it "is nil for both when only one dimension is known" do
      expect(helper.variant_dimensions(image_sized(1200, nil), 500)).to eq [nil, nil]
    end
  end

  describe "#gallery_images" do
    it "orders the images by position" do
      work = create(:action_work)
      last = create(:image, work:, position: 2)
      first = create(:image, work:, position: 1)

      expect(helper.gallery_images(work)).to eq [first, last]
    end

    # The gallery renders every image twice, once in the strip and once in the
    # lightbox, so a relation would be queried again for the second pass.
    it "returns an array rather than a relation" do
      work = create(:action_work, images: [build(:image)])

      expect(helper.gallery_images(work)).to be_an Array
    end

    it "is empty for a work with no images" do
      expect(helper.gallery_images(create(:action_work))).to be_empty
    end

    # The captions come from `credits`, a Mobility *plain* text translation: one
    # query per image without this. Mobility reads plain attributes through the
    # plain_text_translations association, so eager loading the rich text one
    # would load the same table and still leave the read to fire its own query.
    it "eager loads the credits" do
      work = create(:action_work, images: [build(:image)])

      expect(helper.gallery_images(work).first.association(:plain_text_translations))
        .to be_loaded
    end
  end
end
