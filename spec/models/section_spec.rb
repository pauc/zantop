require 'spec_helper'

describe Section do
  let( :work ) { create :visual_work }
  let( :sections ) { create_list :section, 4, content: work }
  let( :section ) { create :section }

  it { section.should respond_to('content') }
  it { section.should respond_to('translations') }
  it { section.should respond_to('position') }

  #it 'without boddy is not valid' do
    #section.body = '   '
    #expect( section ).to_not be_valid
  #end

  it 'delete sections when removing a content' do
    sections
    expect{ work.destroy }.to change{ Section.count }.by(-4)
  end

  it "do not delete a content when deleting a content section" do
    sections
    expect{ sections.first.destroy }.not_to change{ Work.count }
  end
end
