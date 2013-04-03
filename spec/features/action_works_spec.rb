# encoding: utf-8
require 'spec_helper'

describe "ActionWorks" do
  let(:works) { create_list(:action_work, 5) }

  describe "GET /visual_works" do
    it "works!!" do
      works
      visit action_works_path
      expect( page ).to have_content(works.first.title)
      expect( page ).to have_content(works.last.title)
    end
  end

  describe "view work" do
    it "works!!" do
      visit action_work_path(works.first)
      expect( page ).to have_content(works.first.title)
    end
  end

  describe "GET /action_works/new" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      visit new_action_work_path
    end

    it "works!!" do
      expect( page ).to have_selector("form#new_action_work")
    end

    describe "with invalid information" do
      it "fails validation" do
        find('form input[type="submit"]').click
        expect( page ).to have_content("no pot estar en blanc")
      end
    end

    describe "with valid information" do
      before do
        fill_in "action_work[title]", with: "The Title"
        find('form input[type="submit"]').click
      end

      it "redirects to the new work" do
        expect( page ).to have_content('The Title')
      end
    end
  end
end
