require 'spec_helper'

describe ContactMessage do
  before do
    @message = ContactMessage.new(from_email: 'example@example.com',
                                  from_name: 'The name',
                                  subject: 'The subject',
                                  text: 'Some text')
  end

  it { @message.should be_valid }

  describe 'email validations' do

    it 'without email is not valid' do
      @message.from_email = "   "
      @message.should_not be_valid
    end

    it 'with incorrect email is not valid' do
      @message.from_email = 'example.example.com'
      @message.should_not be_valid

      @message.from_email = 'example@example'
      @message.should_not be_valid
    end

    it 'with spaces is not valid' do
      @message.from_email = 'example @example.com'
      @message.should_not be_valid

      @message.from_email = 'example@ example.com'
      @message.should_not be_valid
    end
  end

  it 'without name is not valid' do
    @message.from_name = '   '
    @message.should_not be_valid
  end

  it 'without text is not valid' do
    @message.text = '   '
    @message.should_not be_valid
  end
end
