# frozen_string_literal: true

# Only the behaviour VisualWorkForm adds on top of WorkForm lives here; the shared form
# behaviour it inherits is covered in spec/forms/work_form_spec.rb.
RSpec.describe VisualWorkForm do
  let(:form) { described_class.new }

  describe "#initialize" do
    it "copies the techniques of a persisted work" do
      work = create(:visual_work, techniques: "oli sobre tela")

      expect(described_class.new(work:).techniques).to eq "oli sobre tela"
    end

    it "copies the dimensions of a persisted work" do
      work = create(:visual_work, dimensions: "10x20")

      expect(described_class.new(work:).dimensions).to eq "10x20"
    end

    it "copies the year of a persisted work" do
      work = create(:visual_work, realization_date: Date.new(1998, 3, 14))

      expect(described_class.new(work:).year).to eq 1998
    end

    it "defaults the year of a new work to the current one" do
      expect(form.year).to eq Time.current.year
    end

    it "leaves techniques the locale being edited has not translated empty" do
      work = create(:visual_work, techniques: "oli sobre tela")

      expect(I18n.with_locale(:en) { described_class.new(work:).techniques }).to be_nil
    end

    it "copies the dimensions whatever the locale, since there is only one value" do
      work = create(:visual_work, dimensions: "10x20")

      expect(I18n.with_locale(:en) { described_class.new(work:).dimensions }).to eq "10x20"
    end
  end

  describe "attributes" do
    it "carries the techniques" do
      form.techniques = "oli sobre tela"

      expect(form.techniques).to eq "oli sobre tela"
    end

    it "carries the dimensions" do
      form.dimensions = "10x20"

      expect(form.dimensions).to eq "10x20"
    end
  end

  describe "#submit" do
    it "creates a VisualWork" do
      expect { form.submit(title: "Jurimuri") }.to change(VisualWork, :count).by(1)
    end

    it "stores the techniques" do
      form.submit(title: "Jurimuri", techniques: "oli sobre tela")

      expect(VisualWork.last.techniques).to eq "oli sobre tela"
    end

    it "stores the dimensions" do
      form.submit(title: "Jurimuri", dimensions: "10x20")

      expect(VisualWork.last.dimensions).to eq "10x20"
    end

    it "stores the year as a realization date" do
      form.submit(title: "Jurimuri", year: "1998")

      expect(VisualWork.last.realization_date).to eq Date.new(1998, 1, 1)
    end

    it "reads the stored year back" do
      form.submit(title: "Jurimuri", year: "1998")

      expect(VisualWork.last.year).to eq 1998
    end

    it "keeps the month and the day when the year does not change" do
      work = create(:visual_work, realization_date: Date.new(1998, 3, 14))

      described_class.new(work:).submit(title: work.title, year: "1998")

      expect(work.reload.realization_date).to eq Date.new(1998, 3, 14)
    end

    it "moves the date to January when the year changes" do
      work = create(:visual_work, realization_date: Date.new(1998, 3, 14))

      described_class.new(work:).submit(title: work.title, year: "2005")

      expect(work.reload.realization_date).to eq Date.new(2005, 1, 1)
    end

    it "leaves the realization date alone when no year is given" do
      work = create(:visual_work, realization_date: Date.new(1998, 3, 14))

      described_class.new(work:).submit(title: work.title, year: "")

      expect(work.reload.realization_date).to eq Date.new(1998, 3, 14)
    end
  end

  describe "#submit_button_text" do
    it "offers to create a new visual work" do
      expect(form.submit_button_text).to eq "Crear treball visual"
    end

    it "offers to update a persisted visual work" do
      expect(described_class.new(work: create(:visual_work)).submit_button_text)
        .to eq "Actualitzar treball visual"
    end
  end
end
