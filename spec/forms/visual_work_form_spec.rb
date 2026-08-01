# frozen_string_literal: true

RSpec.describe VisualWorkForm do
  describe "#submit_button_text" do
    it "offers to create a new visual work" do
      expect(described_class.new(work: VisualWork.new).submit_button_text)
        .to eq "Crear treball visual"
    end

    it "offers to update a persisted visual work" do
      expect(described_class.new(work: create(:visual_work)).submit_button_text)
        .to eq "Actualitzar treball visual"
    end
  end

  describe "attributes" do
    it "carries the techniques" do
      form = described_class.new(work: VisualWork.new)
      form.techniques = "oli sobre tela"

      expect(form.techniques).to eq "oli sobre tela"
    end

    it "carries the dimensions" do
      form = described_class.new(work: VisualWork.new)
      form.dimensions = "10x20"

      expect(form.dimensions).to eq "10x20"
    end

    it "defaults the year to the current one" do
      expect(described_class.new(work: VisualWork.new).year).to eq Time.current.year
    end

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
  end
end
