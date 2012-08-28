# == Schema Information
#
# Table name: action_works
#
#  id               :integer         not null, primary key
#  slug_en          :string(255)
#  slug_es          :string(255)
#  slug_ca          :string(255)
#  realization_date :date
#  position         :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

require 'spec_helper'

describe ActionWork do
  before { @work = FactoryGirl.create(:action_work) }

  subject { @work }

  it { should be_valid }
  it { should respond_to(:images) }
  it { should respond_to(:tags) }

  describe "slugs" do
    it "are the same for all locales after create new work" do
      @work.slug_en.should == @work.slug_ca
      @work.slug_en.should == @work.slug_es
    end
  end

  describe "when title is not present" do
    before { @work.title = " " }
    it { should_not be_valid }
  end
end
