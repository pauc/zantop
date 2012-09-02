require 'spec_helper'

describe Tagging do
  before { @tagging = FactoryGirl.create(:tagging) }

  subject { @tagging }

  it { should respond_to (:tag) }
  it { should respond_to (:taggable) }

  describe "whith nil" do
    it "in the field: tag_id" do
      @tagging.tag_id = nil
      should_not be_valid
    end

    it "in the field: taggable_id" do
      @tagging.taggable_id = nil
      should_not be_valid
    end

    it "in the field: taggable_type" do
      @tagging.taggable_type = nil
      should_not be_valid
    end
  end

  describe "deleting a tag" do
    before do
      @tagging.tag.destroy
    end

    it "must destroy its taggings" do
      Tagging.exists?(@tagging).should == false
    end
  end

  describe "deleting a taggable object" do
    before do
      @tagging.taggable.destroy
    end

    it "must destroy its taggings" do
      Tagging.exists?(@tagging).should == false
    end
  end
end
