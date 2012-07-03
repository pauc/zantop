# == Schema Information
#
# Table name: visual_works
#
#  id               :integer         not null, primary key
#  slug_en          :string(255)
#  slug_es          :string(255)
#  slug_ca          :string(255)
#  realization_date :date
#  dimensions       :string(255)
#  position         :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

require 'spec_helper'

describe VisualWork do
  before { @work = FactoryGirl.create(:visual_work) }

  subject { @work }

  it { should be_valid }
  it { should respond_to(:images) }

  describe "when title is not present" do
    before { @work.title = " " }
    it { should_not be_valid }
  end
end
