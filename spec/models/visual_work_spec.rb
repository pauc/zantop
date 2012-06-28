require 'spec_helper'

describe VisualWork do
  before { @visual_work = FactoryGirl.create(:visual_work) }

  subject { @visual_work }

  it 'has type "visual_work"' do
    @visual_work.type.should == 'VisualWork'
  end

  describe "without title is invalid" do
    before { @visual_work.title = nil }

    it { should_not be_valid }
  end
end
