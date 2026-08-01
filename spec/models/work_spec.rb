# frozen_string_literal: true

RSpec.describe Work do
  describe ".published" do
    it "returns published works" do
      work = create(:action_work, published: true)

      expect(described_class.published).to include work
    end

    it "leaves out unpublished works" do
      work = create(:action_work, published: false)

      expect(described_class.published).not_to include work
    end
  end

  describe "validations" do
    it "requires a title" do
      expect(build(:action_work, title: nil)).not_to be_valid
    end
  end

  describe "#first_image" do
    it "returns the medium variant of the first image" do
      work = create(:action_work)
      image = create(:image, work:)

      expect(work.first_image.blob).to eq image.image.blob
    end

    it "returns the medium variant, not another one" do
      work = create(:action_work)
      create(:image, work:)

      expect(work.first_image.variation.transformations)
        .to include(resize_to_fill: [400, 400])
    end

    it "takes the first image when there are several" do
      work = create(:action_work)
      first = create(:image, work:)
      create(:image, work:)

      expect(work.first_image.blob).to eq first.image.blob
    end

    it "is nil when the work has no images" do
      expect(create(:action_work).first_image).to be_nil
    end

    it "is nil when the only image is a video" do
      work = create(:action_work)
      create(:image, :video, work:)

      expect(work.first_image).to be_nil
    end

    it "skips videos and returns the first attached image" do
      work = create(:action_work)
      create(:image, :video, work:)
      image = create(:image, work:)

      expect(work.first_image.blob).to eq image.image.blob
    end

    it "preloads the attachments instead of querying one image at a time" do
      work = create(:action_work)
      create_list(:image, 3, work:)
      work.reload

      queries = 0
      counter = ->(*, payload) { queries += 1 unless payload[:name] == "SCHEMA" }

      ActiveSupport::Notifications.subscribed(counter, "sql.active_record") do
        work.first_image
      end

      expect(queries).to eq 5
    end
  end

  describe "#related" do
    let(:tag) { create(:tag) }

    it "returns published works that share a tag" do
      work = create(:action_work, tags: [tag])
      other = create(:action_work, tags: [tag], published: true)

      expect(work.related).to include other
    end

    it "leaves out the work itself" do
      work = create(:action_work, tags: [tag], published: true)
      create(:action_work, tags: [tag], published: true)

      expect(work.related).not_to include work
    end

    it "leaves out unpublished works" do
      work = create(:action_work, tags: [tag])
      other = create(:action_work, tags: [tag], published: false)

      expect(work.related).not_to include other
    end

    it "leaves out works that share no tag" do
      work = create(:action_work, tags: [tag])
      other = create(:action_work, tags: [create(:tag)], published: true)

      expect(work.related).not_to include other
    end

    it "leaves out works with no tags at all" do
      work = create(:action_work, tags: [tag])
      other = create(:action_work, published: true)

      expect(work.related).not_to include other
    end

    it "leaves out works of another type" do
      work = create(:action_work, tags: [tag])
      other = create(:visual_work, tags: [tag], published: true)

      expect(work.related).not_to include other
    end

    it "matches works sharing any one of several tags" do
      other_tag = create(:tag)
      work = create(:action_work, tags: [tag, other_tag])
      by_first = create(:action_work, tags: [tag], published: true)
      by_second = create(:action_work, tags: [other_tag], published: true)

      expect(work.related).to include(by_first, by_second)
    end

    it "returns a work sharing several tags only once" do
      other_tag = create(:tag)
      work = create(:action_work, tags: [tag, other_tag])
      other = create(:action_work, tags: [tag, other_tag], published: true)

      expect(work.related.to_a.count(other)).to eq 1
    end

    it "returns at most five works" do
      work = create(:action_work, tags: [tag])
      create_list(:action_work, 6, tags: [tag], published: true)

      expect(work.related.size).to eq 5
    end

    it "is empty when the work has no tags" do
      create(:action_work, tags: [tag], published: true)

      expect(create(:action_work).related).to be_empty
    end

    it "preloads the plain text translations" do
      work = create(:action_work, tags: [tag])
      create(:action_work, tags: [tag], published: true)

      expect(work.related.first.association(:plain_text_translations)).to be_loaded
    end
  end

  describe "translations" do
    it "keeps a title per locale" do
      work = create(:action_work)

      I18n.with_locale(:ca) { work.title = "El títol" }
      I18n.with_locale(:en) { work.title = "The title" }
      work.save!

      expect(I18n.with_locale(:ca) { work.reload.title }).to eq "El títol"
      expect(I18n.with_locale(:en) { work.reload.title }).to eq "The title"
    end

    it "keeps a rich text description per locale" do
      work = create(:action_work)

      I18n.with_locale(:ca) { work.description = "La descripció" }
      I18n.with_locale(:en) { work.description = "The description" }
      work.save!

      expect(I18n.with_locale(:ca) { work.reload.description.to_plain_text })
        .to eq "La descripció"
      expect(I18n.with_locale(:en) { work.reload.description.to_plain_text })
        .to eq "The description"
    end
  end

  describe "associations" do
    it "destroys its sections" do
      work = create(:action_work)
      create(:section, work:)

      expect { work.destroy! }.to change(Section, :count).by(-1)
    end

    it "destroys its images" do
      work = create(:action_work)
      create(:image, work:)

      expect { work.destroy! }.to change(Image, :count).by(-1)
    end

    it "destroys its taggings but keeps the tags" do
      work = create(:action_work, tags: [create(:tag)])

      expect { work.destroy! }
        .to change(Tagging, :count).by(-1)
        .and not_change(Tag, :count)
    end
  end
end
