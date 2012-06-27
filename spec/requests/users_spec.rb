require 'spec_helper'

describe "Users" do
  before { @users = FactoryGirl.create_list(:user, 5) }

  describe "GET /users" do
    it "works!" do
      visit users_path
      page.should have_content(@users.first.name)
      page.should have_content(@users.last.name)
    end
  end
end
