require 'spec_helper'

shared_examples_for 'sections integration' do |content_klass|
  let( :content ) { create content_klass }
  let( :user ) { sign_in create(:user) }

  before do
    user
    visit polymorphic_path([:edit, content])
  end

  it 'show fieldset for sections' do
    has_selector? 'fieldset.extra-content-fields'
  end

  it 'add a section' do
    click_link "Add a section"
    section_body = 'A very long text'
    fill_in_ckeditor 'extra-content-fields',
      :with => section_body
    find('form input[type="submit"]').click

    has_content? section_body
  end

  it 'remove a section' do
    section = FactoryGirl.create( :section, content: content )
    expect( content.sections.count ).to eq 1
    visit polymorphic_path([content])
    has_content? section.body

    visit polymorphic_path([:edit, content])
    find('fieldset.extra-content-fields a.remove_nested_fields').click
    find('form input[type="submit"]').click

    has_no_content? section.body
    expect( Section.all.size ).to eq 0
    expect( content.sections.count ).to eq 0
  end

  it 'update a sections' do
    section = FactoryGirl.create( :section, content: content )
    expect( content.sections.count ).to eq 1
    visit polymorphic_path([content])
    has_content? section.body

    original_body = section.body
    updated_section_body = 'A new text for the section'

    visit polymorphic_path([:edit, content])
    fill_in_ckeditor 'extra-content-fields',
      :with => updated_section_body
    find('form input[type="submit"]').click

    has_no_content? original_body
    has_content? updated_section_body
  end
end

describe 'action works', js: true do |content_klass|
  it_behaves_like 'sections integration', :action_work
end

describe 'visual works', js: true do |content_klass|
  it_behaves_like 'sections integration', :visual_work
end
