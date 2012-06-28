# == Schema Information
#
# Table name: works
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  type        :string(255)
#  realized    :date
#  where       :string(255)
#  position    :integer
#  visible     :boolean
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Work do
  before { @work = FactoryGirl.create(:work) }

  subject { @work }

  describe "without title is invalid" do
    before { @work.title = nil }

    it { should_not be_valid }
  end
end
