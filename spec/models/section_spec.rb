# frozen_string_literal: true

RSpec.describe Section do
  describe "validations" do
    it "requires a body" do
      expect(build(:section, body: nil)).not_to be_valid
    end

    it "requires a work" do
      expect(build(:section, work: nil)).not_to be_valid
    end

    it "does not require a title" do
      expect(build(:section, title: nil)).to be_valid
    end
  end

  describe "translations" do
    it "keeps a plain title per locale" do
      section = create(:section)

      I18n.with_locale(:ca) { section.title = "El títol" }
      I18n.with_locale(:en) { section.title = "The title" }
      section.save!

      expect(I18n.with_locale(:ca) { section.reload.title }).to eq "El títol"
      expect(I18n.with_locale(:en) { section.reload.title }).to eq "The title"
    end

    it "keeps a rich text body per locale" do
      section = create(:section)

      I18n.with_locale(:ca) { section.body = "El cos" }
      I18n.with_locale(:en) { section.body = "The body" }
      section.save!

      expect(I18n.with_locale(:ca) { section.reload.body.to_plain_text }).to eq "El cos"
      expect(I18n.with_locale(:en) { section.reload.body.to_plain_text }).to eq "The body"
    end
  end
end
