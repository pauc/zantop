# frozen_string_literal: true

RSpec.describe Page do
  describe ".about" do
    it "returns the page with the About id" do
      page = create(:page)

      expect(described_class.about).to eq page
    end

    it "raises when the About row is missing" do
      expect { described_class.about }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe ".contact" do
    it "returns the page with the Contact id" do
      page = create(:page, :contact)

      expect(described_class.contact).to eq page
    end

    it "raises when the Contact row is missing" do
      expect { described_class.contact }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "#about?" do
    it "is true for the About page" do
      expect(create(:page).about?).to be true
    end

    it "is false for the Contact page" do
      expect(create(:page, :contact).about?).to be false
    end
  end

  describe "#contact?" do
    it "is true for the Contact page" do
      expect(create(:page, :contact).contact?).to be true
    end

    it "is false for the About page" do
      expect(create(:page).contact?).to be false
    end
  end

  describe "validations" do
    it "is valid with a title and a body" do
      expect(build(:page)).to be_valid
    end

    it "is invalid without a title" do
      expect(build(:page, title: nil)).not_to be_valid
    end

    it "is invalid with a blank title" do
      expect(build(:page, title: "   ")).not_to be_valid
    end

    it "is invalid without a body" do
      expect(build(:page, body: nil)).not_to be_valid
    end

    it "is invalid with a blank body" do
      expect(build(:page, body: "")).not_to be_valid
    end
  end

  describe "translations" do
    it "keeps a title per locale" do
      page = create(:page)
      I18n.with_locale(:es) { page.update!(title: "Bio") }

      expect(I18n.with_locale(:ca) { page.reload.title }).to eq "About"
    end

    it "keeps a body per locale" do
      page = create(:page)
      I18n.with_locale(:es) { page.update!(body: "<p>Zigzaguea</p>") }

      expect(I18n.with_locale(:es) { page.reload.body.to_s }).to include "Zigzaguea"
    end

    it "seeds the default locale from the locale it was written in" do
      page = I18n.with_locale(:en) { create(:page, title: "About") }

      expect(I18n.with_locale(:ca) { page.reload.title }).to eq "About"
    end

    it "seeds the default locale's body too" do
      page = I18n.with_locale(:en) { create(:page, body: "<p>The bio</p>") }

      expect(I18n.with_locale(:ca) { page.reload.body.body.to_html }).to eq "<p>The bio</p>"
    end

    it "reports the locales it has been translated into" do
      page = I18n.with_locale(:ca) { create(:page) }

      expect(page.translated_into?(:en)).to be false
    end
  end
end
