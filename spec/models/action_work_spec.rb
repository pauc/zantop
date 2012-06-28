require 'spec_helper'

describe ActionWork do
  before { @action_work = FactoryGirl.create(:action_work) }

  subject { @action_work }

  it 'has type "action_work"' do
    @action_work.type.should == 'ActionWork'
  end

  describe "without title is invalid" do
    before { @action_work.title = nil }

    it { should_not be_valid }
  end
end
