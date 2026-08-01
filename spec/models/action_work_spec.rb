# frozen_string_literal: true

RSpec.describe ActionWork do
  it "is stored as a Work of type ActionWork" do
    expect(create(:action_work).type).to eq "ActionWork"
  end

  it "is not returned by the VisualWork scope" do
    work = create(:action_work)

    expect(VisualWork.all).not_to include work
  end

  it "keeps a place per locale" do
    work = create(:action_work)

    I18n.with_locale(:ca) { work.place = "Barcelona" }
    I18n.with_locale(:en) { work.place = "Barcelona, Catalonia" }
    work.save!

    expect(I18n.with_locale(:ca) { work.reload.place }).to eq "Barcelona"
    expect(I18n.with_locale(:en) { work.reload.place }).to eq "Barcelona, Catalonia"
  end
end
