# frozen_string_literal: true

RSpec.describe Tag do
  describe ".enabled" do
    it "returns a tag attached to a published work" do
      tag = create(:tag)
      create(:action_work, tags: [tag], published: true)

      expect(described_class.enabled).to include tag
    end

    it "leaves out a tag whose works are all unpublished" do
      tag = create(:tag)
      create(:action_work, tags: [tag], published: false)

      expect(described_class.enabled).not_to include tag
    end

    it "leaves out a tag with no works" do
      tag = create(:tag)

      expect(described_class.enabled).not_to include tag
    end

    it "returns a tag once even when several published works carry it" do
      tag = create(:tag)
      create_list(:action_work, 3, tags: [tag], published: true)

      expect(described_class.enabled.to_a.count(tag)).to eq 1
    end

    it "returns the tag with its attributes, not just the id" do
      tag = create(:tag, name: "escultura")
      create(:action_work, tags: [tag], published: true)

      expect(described_class.enabled.first.name).to eq "escultura"
    end
  end

  describe "#untranslated?" do
    it "is true when the name is only translated into one locale" do
      expect(create(:tag).untranslated?).to be true
    end

    it "is true when the name is translated into two locales" do
      tag = build(:tag)
      I18n.with_locale(:ca) { tag.name = "escultura" }
      I18n.with_locale(:es) { tag.name = "escultura es" }
      tag.save!

      expect(tag.reload.untranslated?).to be true
    end

    it "is false when the name is translated into all three locales" do
      tag = build(:tag)
      I18n.with_locale(:ca) { tag.name = "escultura" }
      I18n.with_locale(:es) { tag.name = "escultura es" }
      I18n.with_locale(:en) { tag.name = "sculpture" }
      tag.save!

      expect(tag.reload.untranslated?).to be false
    end
  end

  describe "#name_to_underscore" do
    it "downcases the name before saving" do
      expect(create(:tag, name: "ESCULTURA").reload.name).to eq "escultura"
    end

    it "leaves an already lowercase name alone" do
      expect(create(:tag, name: "escultura").reload.name).to eq "escultura"
    end

    it "downcases a mixed case name" do
      expect(create(:tag, name: "Art D'Acció").reload.name).to eq "art d'acció"
    end

    it "downcases the name seeded into the default locale" do
      tag = I18n.with_locale(:es) { create(:tag, name: "Escultura") }

      expect(I18n.with_locale(:ca) { tag.reload.name }).to eq "escultura"
    end

    it "downcases the name on update too" do
      tag = create(:tag, name: "escultura")

      expect { tag.update!(name: "PINTURA") }
        .to change { tag.reload.name }
        .from("escultura")
        .to("pintura")
    end
  end

  describe "validations" do
    it "requires a name" do
      expect(build(:tag, name: nil)).not_to be_valid
    end

    it "rejects a blank name" do
      expect(build(:tag, name: "")).not_to be_valid
    end
  end

  describe "associations" do
    it "reaches its works through the taggings" do
      tag = create(:tag)
      work = create(:action_work, tags: [tag])

      expect(tag.works).to eq [work]
    end

    it "destroys its taggings but keeps the works" do
      tag = create(:tag)
      create(:action_work, tags: [tag])

      expect { tag.destroy! }
        .to change(Tagging, :count).by(-1)
        .and not_change(Work, :count)
    end
  end
end
