require 'spec_helper'

describe Tag do
  let(:tag) { FactoryGirl.create(:tag) }

  it { should respond_to (:works) }
  it { should respond_to (:taggings) }

  it "without name is not valid" do
    tag = FactoryGirl.build(:tag, name: "   ")
    tag.should_not be_valid
  end

  it "there are untranslated tags" do
    FactoryGirl.create_list(:tag, 15)
    Tag.all_translated?.should be_false
  end

  it "all tags are translated" do
    FactoryGirl.create_list(:tag, 15)
    Tag.all.each do |tag|
      tag_name = tag.name
      I18n.locale = :es
      tag.name = tag_name + "_es"
      tag.save
      I18n.locale = :en
      tag.name = tag_name + "_en"
      tag.save
    end
    Tag.all_translated?.should be_true
  end

  describe "update taggings counter" do
    before do
      3.times { FactoryGirl.create(:tagging, tag: tag) }
    end

    it "when adding a tagging" do
      FactoryGirl.create(:tagging, tag: tag)
      tag.reload.taggings_count.should eq 4
    end

    it "when deleting a tagging" do
      tag.taggings.last.destroy
      tag.reload.taggings_count.should eq 2
    end
  end

  describe "enabled tags" do
    it "tags without taggings are not enabled" do
      FactoryGirl.create_list(:tag, 15)
      Tag.enabled.size.should eq 0
    end

    it "tags with taggings are enabled" do
      FactoryGirl.create_list(:tagging, 2)
      Tag.enabled.size.should eq 2
    end

    it 'tags with taggings related to unpublised content are not enabled' do
      w = FactoryGirl.create :visual_work, published: false
      tagging = FactoryGirl.create( :tagging, tag: tag, taggable: w )
      expect( Tag.enabled.size ).to eq 0
    end
  end
end
