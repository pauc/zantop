# frozen_string_literal: true

# Only the behaviour VisualWorkForm adds on top of WorkForm lives here; the shared form
# behaviour it inherits is covered in spec/forms/work_form_spec.rb.
RSpec.describe VisualWorkForm do
  # WorkForm defaults to an ActionWork, so a visual work has to be passed in explicitly.
  let(:form) { described_class.new(work: VisualWork.new) }

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
