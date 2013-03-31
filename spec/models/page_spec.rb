require 'spec_helper'

describe Page do
  let( :page ) { create( :page ) }

  it { page.should be_valid }

  it 'without title is not valid' do
    page.title = '   '
    expect( page ).not_to be_valid
  end

  it 'without body is not valid' do
    page.body = '   '
    expect( page ).not_to be_valid
  end
end
