require 'spec_helper'

describe Link do
  it { should respond_to :title }
  it { should respond_to :url }

  let(:link) { FactoryGirl.create(:link) }
  subject { link }

  describe "validations" do
    it { should be_valid }

    it "without url" do
      link.url = ""
      should_not be_valid
    end

    it "without title" do
      link.title = ""
      should be_valid
    end

    it "if title is blank it takes url" do
      link.title = ""
      link.save
      link.title.should eq link.url
    end
  end
end
