require 'spec_helper'

describe Tag do
  before { @tag = FactoryGirl.create(:tag) }

  subject { @tag }

  it { should respond_to (:visual_works) }
  it { should respond_to (:action_works) }
  it { should respond_to (:taggings) }
  it { should respond_to(:taggables) }

  it "without name is not valid" do
    @tag.name = "  "
    should_not be_valid
  end
end
