require 'spec_helper'

describe TagsController do
  let(:tag) { FactoryGirl.create(:tag) }

  describe "tag path" do
    it "works" do
      visit tag_path(tag)
      response.status.should eq 200
    end
  end

  describe "admin tags path" do
    it "works" do
      visit admin_tags_path
      current_path.should == login_path
    end
  end
end
