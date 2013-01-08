require 'spec_helper'

describe LinksController do
  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }

  it "works!!" do
    visit admin_links_path
    current_path.should eq admin_links_path
  end
end
