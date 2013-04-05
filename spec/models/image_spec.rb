require 'spec_helper'

describe Image do
  after do
    FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads"])
  end

  let(:image) { build(:image) }

  it { image.should respond_to :illustrated }
  it { image.should be_valid }

  it "is not valid without image or video field" do
    image.remove_image!
    image.should_not be_valid
  end

  it 'is valid with only the video field' do
    image.remove_image!
    image.video = 'http://youtube.com/2345435'
    expect( image ).to be_valid
  end

  it 'with video and image is not valid' do
    image.video = 'http://youtube.com/2345435'
    expect( image ).not_to be_valid
  end
end
