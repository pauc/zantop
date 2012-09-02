# encoding: utf-8
require 'spec_helper'

describe "VisualWorks" do
  before { @works = FactoryGirl.create_list(:visual_work, 5) }
  subject { page }

  describe "GET /visual_works" do
    it "works!!" do
      visit visual_works_path
      page.should have_content(@works.first.title)
      page.should have_content(@works.last.title)
    end
  end

  describe "GET /visual_works/new" do
    before { visit new_visual_work_path }
    it "works!!" do
      should have_selector("form#new_visual_work")
    end

    describe "with invalid information" do
      it "fails validation" do
        find('form input[type="submit"]').click
        should have_content("can't be blank")
      end
    end

    describe "with valid information" do
      before do
        fill_in "visual_work[title]", with: "The Title"
        find('form input[type="submit"]').click        
      end

      it "redirects to the new work" do
        current_path.should == visual_work_path(VisualWork.last)
        should have_content(VisualWork.last.title)
      end
    end
  end
end