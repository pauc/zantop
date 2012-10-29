require 'spec_helper'

describe Tag do
  let(:tag) { FactoryGirl.create(:tag) }

  subject { tag }

  it { should respond_to (:works) }
  it { should respond_to (:taggings) }

  it "without name is not valid" do
    tag.name = "  "
    should_not be_valid
  end
end
