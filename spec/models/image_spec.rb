require 'spec_helper'

describe Image do
  before { @image = FactoryGirl.create(:image) }

  subject { @image }

  it { should respond_to :illustrated }

  it "is not valid without image field" do
    @image.image = " "
    should_not be_valid
  end 
end
