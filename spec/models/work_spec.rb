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

  describe ".ordered" do
    it "returns the highest position first" do
      oldest = create(:action_work, position: 1)
      middle = create(:action_work, position: 2)
      newest = create(:action_work, position: 3)

      expect(described_class.ordered).to eq [newest, middle, oldest]
    end

    it "interleaves visual and action works" do
      visual = create(:visual_work, position: 2)
      action = create(:action_work, position: 1)

      expect(described_class.ordered).to eq [visual, action]
    end

    it "breaks ties on position with the newest record first" do
      first = create(:action_work, position: 1)
      second = create(:action_work, position: 1)

      expect(described_class.ordered).to eq [second, first]
    end
  end

  describe ".reposition" do
    it "puts the works in the order the ids arrive" do
      first = create(:action_work, position: 1)
      second = create(:action_work, position: 2)
      third = create(:action_work, position: 3)

      described_class.reposition([first.id, third.id, second.id])

      expect(described_class.ordered).to eq [first, third, second]
    end

    it "deals out the works' own positions rather than renumbering from one" do
      low = create(:action_work, position: 4)
      high = create(:action_work, position: 9)

      described_class.reposition([low.id, high.id])

      expect([low.reload.position, high.reload.position]).to eq [9, 4]
    end

    it "leaves the position of a work it was not given alone" do
      untouched = create(:action_work, position: 50)
      first = create(:action_work, position: 1)
      second = create(:action_work, position: 2)

      described_class.reposition([first.id, second.id])

      expect(untouched.reload.position).to eq 50
    end

    it "accepts ids as strings, as they arrive over JSON" do
      first = create(:action_work, position: 1)
      second = create(:action_work, position: 2)

      described_class.reposition([first.id.to_s, second.id.to_s])

      expect(described_class.ordered).to eq [first, second]
    end

    it "ignores ids of works that no longer exist" do
      first = create(:action_work, position: 1)
      second = create(:action_work, position: 2)

      described_class.reposition([first.id, 0, second.id])

      expect(described_class.ordered).to eq [first, second]
    end

    it "leaves updated_at alone, so the front page keeps its cached fragments" do
      first = create(:action_work, position: 1)
      second = create(:action_work, position: 2)

      expect { described_class.reposition([first.id, second.id]) }
        .not_to change { first.reload.updated_at }
    end

    it "does nothing when given no ids" do
      work = create(:action_work, position: 3)

      described_class.reposition([])

      expect(work.reload.position).to eq 3
    end
  end

  describe "positioning" do
    it "assigns the next position on create" do
      create(:action_work, position: 7)

      expect(create(:action_work).position).to eq 8
    end

    it "starts the sequence at one when there are no works yet" do
      expect(create(:action_work).position).to eq 1
    end

    it "keeps a position that was given explicitly" do
      expect(create(:action_work, position: 42).position).to eq 42
    end

    it "continues one sequence across both subclasses" do
      create(:visual_work, position: 3)

      expect(create(:action_work).position).to eq 4
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

    it "returns the highest position first" do
      work = create(:action_work, tags: [tag])
      oldest = create(:action_work, position: 1, tags: [tag], published: true)
      newest = create(:action_work, position: 2, tags: [tag], published: true)

      expect(work.related).to eq [newest, oldest]
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

    it "orders its sections by position" do
      work = create(:action_work)
      last = create(:section, work:, position: 2)
      first = create(:section, work:, position: 1)

      expect(work.reload.sections).to eq [first, last]
    end

    it "orders its images by position" do
      work = create(:action_work)
      last = create(:image, :video, work:, position: 2)
      first = create(:image, :video, work:, position: 1)

      expect(work.reload.images).to eq [first, last]
    end

    it "orders images left with gaps by deleted siblings" do
      work = create(:action_work)
      last = create(:image, :video, work:, position: 9)
      first = create(:image, :video, work:, position: 4)

      expect(work.reload.images).to eq [first, last]
    end
  end
end
