# frozen_string_literal: true

RSpec.describe HasTranslations do
  describe "#translated_into?" do
    it "is true for a locale with a plain text translation" do
      work = I18n.with_locale(:ca) { create(:action_work, description: nil) }

      expect(work.translated_into?(:ca)).to be true
    end

    it "is true for a locale with only a rich text translation" do
      work = create(:action_work)
      I18n.with_locale(:en) { work.update!(description: "The description") }

      expect(work.reload.translated_into?(:en)).to be true
    end

    it "is false for a locale with no translation at all" do
      work = I18n.with_locale(:ca) { create(:action_work) }

      expect(work.translated_into?(:en)).to be false
    end

    it "accepts the locale as a string" do
      work = I18n.with_locale(:ca) { create(:action_work) }

      expect(work.translated_into?("ca")).to be true
    end

    it "accepts the locale as a symbol" do
      work = I18n.with_locale(:ca) { create(:action_work) }

      expect(work.translated_into?(:ca)).to be true
    end

    it "is false for an unknown locale" do
      work = I18n.with_locale(:ca) { create(:action_work) }

      expect(work.translated_into?(:de)).to be false
    end

    it "does not match a locale that is only a prefix of another" do
      work = create(:action_work)
      I18n.with_locale(:en) { work.update!(title: "The title") }

      expect(work.reload.translated_into?(:e)).to be false
    end
  end

  describe ".included" do
    let(:model) do
      Class.new(ApplicationRecord) { self.table_name = "pages" }
    end

    it "extends the including class with Mobility" do
      model.include(described_class)

      expect(model.singleton_class).to be < Mobility
    end

    it "gives the including class the translates macro" do
      model.include(described_class)

      expect(model).to respond_to(:translates)
    end

    it "leaves a class that does not include it without Mobility" do
      expect(model).not_to respond_to(:translates)
    end
  end
end
