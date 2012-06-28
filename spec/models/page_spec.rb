require 'spec_helper'

describe Page do
  before do
    pages = Page.all
    if pages.empty?
      Page.create!([{title: 'About page', body: 'This is the about page'},
                    {title: 'Contact page', body: 'This is the contact page'}]) 
    end
  end

  it { Page.all.size.should equal 2 }

  describe 'with id 1 is the "about" page' do
    before do
      @p = Page.find(1)
      @about = Page.about
    end
    it { @about.should == @p }
  end

  describe 'with id 2 is the "contact" page' do
    before do
      @p = Page.find(1)
      @about = Page.about
    end
    it { @about.should == @p }
  end
end
