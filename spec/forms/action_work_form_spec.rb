# frozen_string_literal: true

# Only the behaviour ActionWorkForm adds on top of WorkForm lives here; the shared form
# behaviour it inherits is covered in spec/forms/work_form_spec.rb.
RSpec.describe ActionWorkForm do
  describe "#initialize" do
    it "copies the place of a persisted work" do
      work = create(:action_work, place: "Barcelona")

      expect(described_class.new(work:).place).to eq "Barcelona"
    end

    it "copies the realization date of a persisted work" do
      work = create(:action_work, realization_date: Date.new(1998, 3, 14))

      expect(described_class.new(work:).realization_date).to eq Date.new(1998, 3, 14)
    end

    it "leaves a place the locale being edited has not translated empty" do
      work = create(:action_work, place: "Barcelona")

      expect(I18n.with_locale(:en) { described_class.new(work:).place }).to be_nil
    end

    it "copies the realization date whatever the locale, since there is only one value" do
      work = create(:action_work, realization_date: Date.new(1998, 3, 14))

      expect(I18n.with_locale(:en) { described_class.new(work:).realization_date })
        .to eq Date.new(1998, 3, 14)
    end
  end

  describe "#submit" do
    it "creates an ActionWork" do
      expect { described_class.new.submit(title: "Jurimuri") }
        .to change(ActionWork, :count)
        .by(1)
    end

    it "stores the place" do
      described_class.new.submit(title: "Jurimuri", place: "Barcelona")

      expect(ActionWork.last.place).to eq "Barcelona"
    end

    it "stores the realization date" do
      described_class.new.submit(title: "Jurimuri", realization_date: "1998-03-14")

      expect(ActionWork.last.realization_date).to eq Date.new(1998, 3, 14)
    end
  end

  describe "#submit_button_text" do
    it "offers to create a new action work" do
      expect(described_class.new.submit_button_text).to eq "Crear treball d'acció"
    end

    it "offers to update a persisted action work" do
      expect(described_class.new(work: create(:action_work)).submit_button_text)
        .to eq "Actualitzar treball d'acció"
    end
  end
end
