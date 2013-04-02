# encoding: utf-8
require 'spec_helper'

describe "Authentication" do
  let(:user) { create(:user) }

  describe "signin page" do
    before { visit login_path }
    it { current_path.should == login_path }
    it "exists" do
      expect( page ).to have_selector 'form#new_session'
    end
  end

  describe "signin" do
    before { visit login_path }

    describe "with invalid information" do
      before { click_button "login" }

      it 'show an error message' do
        expect( page ).to have_selector('div.alert.alert-error')
      end

      it 'show the login page' do
        expect( page ).to have_selector('div.alert.alert-error')
      end
    end

    describe "with valid information" do

      before do
        fill_in "new_session[email]",    with: user.email
        fill_in "new_session[password]", with: user.password
        click_button "login"
      end

      it 'user is loged in' do
        expect( page ).to have_selector('#admin_bar')
      end
    end
  end

  describe 'sign out' do
    before { sign_in user }

    it 'there is a link to log out' do
      expect( page ).to have_link('Sortir', href: logout_path)
    end

    it 'close session' do
      click_link "Sortir"
      expect( page ).not_to have_selector('#admin_bar')
    end

    it 'redirect to the home page' do
      expect( current_path ).to eq front_path(locale: I18n.locale)
    end
  end
end
