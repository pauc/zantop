require 'spec_helper'

describe 'Dashboards integration', js: true do
  let(:works) { create_list( :action_work, 20 ) }
  before { visit root_path }

  describe 'with empty pagination' do
    it 'there is no link to get more works' do
      expect( page ).not_to have_selector "#ajx_get_works"
    end
  end

  describe 'with pagination' do
    before do
      works
      visit root_path
    end

    it 'there is a link to get more works' do
      expect( page ).to have_selector "#ajx_get_works"
    end

    it 'show 6 works' do
      expect( page ).to have_selector('#works .work', count: 6)
    end

    it 'fetch more works' do
      click_link('ajx_get_works')
      expect( page ).to have_selector('#works .work', count: 12)
    end
  end
end
