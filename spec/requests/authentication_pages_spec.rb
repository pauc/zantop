# encoding: utf-8
require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit login_path }
    it { should have_selector('form#new_session') }
  end

  describe "signin" do
    before { visit login_path }

    describe "with invalid information" do
      before { click_button "login" }

      it { should have_selector('div.alert.alert-error') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "new_session[email]",    with: user.email
        fill_in "new_session[password]", with: user.password
        click_button "login"
      end

      it { should have_selector('div.alert.alert-success') }
      it { should have_link('log out', href: logout_path) }
    end
  end
end
