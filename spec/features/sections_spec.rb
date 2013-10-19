require 'spec_helper'

shared_examples_for 'sections integration' do |content_klass|
  let(:content ) { create content_klass }
  let(:section) { create :section, content: content }

  before do
    sign_in FactoryGirl.create(:user)
  end

  it 'show fieldset for sections' do
    visit polymorphic_path([:edit, content])
    has_selector? 'fieldset.extra-content-fields'
  end

  it 'add a section' do
    visit polymorphic_path([:edit, content])
    click_link "Add a section"
    section_body = 'A very long text'
    fill_in_ckeditor 'extra-content-fields',
      :with => section_body
    find('form input[type="submit"]').click

    has_content? section_body
  end

  it 'remove a section' do
    section
    visit polymorphic_path([content])
    has_content? section.body

    visit polymorphic_path([:edit, content])
    find('fieldset.extra-content-fields a.remove_nested_fields').click
    find('form input[type="submit"]').click

    has_no_content? section.body
    expect(content.sections.count).to eq 0
  end

  it 'update sections' do
    section
    
    original_body = section.body
    updated_section_body = 'A new text for the section'

    visit polymorphic_path([:edit, content])
    has_content? section.body
    fill_in_ckeditor 'extra-content-fields',
      :with => updated_section_body
    find('form input[type="submit"]').click

    has_no_content? original_body
    has_content? updated_section_body
  end
end

describe 'action works', js: true do
  it_behaves_like 'sections integration', :action_work
end

describe 'visual works', js: true do
  it_behaves_like 'sections integration', :visual_work
end

