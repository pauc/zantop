# encoding: utf-8
require 'spec_helper'

describe 'Authorization' do
  describe 'as guest user ' do
    let(:work) { FactoryGirl.create(:visual_work, published: false) }

    it 'cannot see unpublished content' do
      visit visual_work_path(work)
      current_path.should == login_path
      page.should have_content('Accés restringit')
    end

    it 'cannot create new content' do
      visit new_visual_work_path
      current_path.should == login_path
      page.should have_content('Accés restringit')

      visit new_action_work_path
      current_path.should == login_path
      page.should have_content('Accés restringit')
    end

    it "cannot admin works" do
      visit admin_works_path
      current_path.should == login_path
      page.should have_content('Accés restringit')
    end

    it "cannot admin links" do
      visit admin_links_path
      current_path.should == login_path
      page.should have_content('Accés restringit')
    end
  end
end
