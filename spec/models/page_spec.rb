# == Schema Information
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  body       :text
#  position   :integer
#  slug       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Page do
  pages = Page.all
  if pages.empty?
    Page.create([{title: 'About page', body: 'This is the about page'},
                  {title: 'Contact page', body: 'This is the contact page'}]) 
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
      @p = Page.find(2)
      @contact = Page.contact
    end
    it { @contact.should == @p }
  end
end
