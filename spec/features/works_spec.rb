require 'spec_helper'

describe 'Works management' do
  let(:works) { create_list( :action_work, 15 ) }
  let(:user) { create( :user ) }

  before do
    works
    sign_in user
    visit admin_works_path
  end

  it { current_path.should == admin_works_path }

  it "show translations info div" do
   expect( page ).to have_selector("div.translations-info", works.size)
  end

  describe "translation info" do
    before do
      I18n.with_locale(:es) do
        works.first.update_attributes(title: "Title ES")
      end
      visit admin_works_path
    end

    it "mark all works as translated to original locale" do
      expect( page ).to have_selector('div.translation-ca .translated',
                                      count: works.size)
    end

    it "mark works as translated to translated locales" do
      within "li#work_#{works.first.id}" do
        expect( page ).to have_selector('div.translation-es .translated')
      end
    end

    it "marks works as untranslated to untranslated locales" do
      expect( page ).to have_selector('div.translation-en .untranslated',
                                      count: works.size)
      expect( page ).to have_selector('div.translation-es .untranslated',
                                      count: works.size - 1)
    end
  end
end
