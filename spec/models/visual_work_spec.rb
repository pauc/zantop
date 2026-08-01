# frozen_string_literal: true

RSpec.describe VisualWork do
  describe "#year" do
    it "is the year of the realization date" do
      work = build(:visual_work, realization_date: Date.new(1998, 3, 14))

      expect(work.year).to eq 1998
    end

    it "is nil without a realization date" do
      expect(build(:visual_work, realization_date: nil).year).to be_nil
    end
  end

  describe "single table inheritance" do
    it "is stored as a Work of type VisualWork" do
      expect(create(:visual_work).type).to eq "VisualWork"
    end

    it "is not returned by the ActionWork scope" do
      work = create(:visual_work)

      expect(ActionWork.all).not_to include work
    end
  end
end
