require 'spec_helper'

describe Work do
  let(:work) { create :action_work }

  it { work.should respond_to(:related) }

  describe "related works" do
    let(:work1) { create :action_work }
    let(:work2) { create :action_work }
    let(:visual_w) { create :visual_work }
    let(:tag1) { create :tag }
    let(:tag2) { create :tag }

    before do
      FactoryGirl.create :tagging, tag: tag1, taggable: work
      FactoryGirl.create :tagging, tag: tag1, taggable: work1
      FactoryGirl.create :tagging, tag: tag1, taggable: visual_w
    end

    it "is not empty" do
      expect( work.related ).not_to be_empty
    end

    it 'return only the same class of works' do
      expect( work.related ).not_to include visual_w
    end

    it "return works tagged with the same tags" do
      FactoryGirl.create :tagging, tag: tag2, taggable: work
      FactoryGirl.create :tagging, tag: tag2, taggable: work2

      expect( work.related ).to include(work1, work2)
    end

    it "do not return other works" do
      FactoryGirl.create :tagging, tag: tag2, taggable: work2

      expect( work.related ).to include work1
      expect( work.related ).not_to include work2
    end

    it "not include the same work" do
      expect( work.related ).not_to include work
    end
  end
end
