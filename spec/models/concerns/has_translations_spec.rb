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

  describe "seeding the default locale" do
    it "writes the default locale from the locale the record was written in" do
      work = I18n.with_locale(:en) { create(:action_work, title: "The Title") }

      expect(I18n.with_locale(:ca) { work.reload.title }).to eq "The Title"
    end

    it "seeds a work of the other subclass just the same" do
      work = I18n.with_locale(:es) { create(:visual_work, title: "El título") }

      expect(I18n.with_locale(:ca) { work.reload.title }).to eq "El título"
    end

    it "seeds every attribute the record was given" do
      work = I18n.with_locale(:en) { create(:visual_work, techniques: "Oil on canvas") }

      expect(I18n.with_locale(:ca) { work.reload.techniques }).to eq "Oil on canvas"
    end

    it "seeds rich text as the markup it was written as" do
      work = I18n.with_locale(:en) { create(:action_work, description: "<p>The <em>work</em></p>") }

      expect(I18n.with_locale(:ca) { work.reload.description.body.to_html })
        .to eq "<p>The <em>work</em></p>"
    end

    it "does not seed rich text with its rendered form" do
      work = I18n.with_locale(:en) { create(:action_work, description: "<p>The work</p>") }

      expect(I18n.with_locale(:ca) { work.reload.description.body.to_html })
        .not_to include "trix-content"
    end

    it "leaves a value the default locale already has" do
      work = create(:action_work, title: "El títol")
      I18n.with_locale(:en) { work.update!(title: "The Title") }

      expect(I18n.with_locale(:ca) { work.reload.title }).to eq "El títol"
    end

    it "seeds an attribute the default locale is missing on a later save" do
      work = I18n.with_locale(:en) { create(:action_work, techniques: nil) }
      I18n.with_locale(:en) { work.update!(techniques: "Oil on canvas") }

      expect(I18n.with_locale(:ca) { work.reload.techniques }).to eq "Oil on canvas"
    end

    it "seeds nothing for an attribute the record has no value for" do
      work = I18n.with_locale(:en) { create(:action_work, description: nil) }

      expect(I18n.with_locale(:ca) { work.reload.description.body }).to be_nil
    end

    it "seeds the default locale and no other" do
      work = I18n.with_locale(:en) { create(:action_work) }

      expect(work.reload.translated_into?(:es)).to be false
    end

    it "counts the record as translated into the default locale" do
      work = I18n.with_locale(:en) { create(:action_work) }

      expect(work.reload.translated_into?(:ca)).to be true
    end

    it "leaves the record written in the default locale untranslated elsewhere" do
      work = create(:action_work)

      expect(work.reload.translated_into?(:en)).to be false
    end

    it "seeds a section written through its work" do
      section = I18n.with_locale(:en) { create(:section, title: "The Section") }

      expect(I18n.with_locale(:ca) { section.reload.title }).to eq "The Section"
    end

    it "seeds a section's rich text body" do
      section = I18n.with_locale(:en) { create(:section, body: "<p>The body</p>") }

      expect(I18n.with_locale(:ca) { section.reload.body.body.to_html }).to eq "<p>The body</p>"
    end

    it "seeds an image's credits" do
      image = I18n.with_locale(:en) { create(:image, :video, credits: "Photo: Someone") }

      expect(I18n.with_locale(:ca) { image.reload.credits }).to eq "Photo: Someone"
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
