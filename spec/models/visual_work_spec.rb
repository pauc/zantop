require 'spec_helper'

describe VisualWork do
  let(:work) { FactoryGirl.create(:visual_work) }

  subject { work }

  it { should be_valid }
  it { should respond_to(:images) }
  it { should respond_to(:tags) }

  describe "slugs" do
    it "are the same for all locales after create new work" do
      work.slug_en.should == work.slug_ca
      work.slug_en.should == work.slug_es
    end
  end

  describe "when title is not present" do
    before { work.title = " " }
    it { should_not be_valid }
  end
end
