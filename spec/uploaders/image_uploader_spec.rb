require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    @image = FactoryGirl.create(:image)
    ImageUploader.enable_processing = true
    @uploader = ImageUploader.new(@image, :image)
    @uploader.store!(File.open("#{Rails.root}/spec/images_for_tests/HomoLuxus.jpg"))
  end

  after do
    ImageUploader.enable_processing = false
    FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads"])
  end

  context 'the thumb version' do
    it "should scale down an image to fit within 100x100 pixels" do
      @uploader.thumb.should be_no_larger_than(100, 100)
    end
  end

  context 'the medium version' do
    it "should scale down an image to fit within 400 x 300 pixels" do
      @uploader.medium.should be_no_larger_than(400, 400)
    end
  end
end
