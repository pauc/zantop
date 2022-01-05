require 'rails_helper'

RSpec.describe ContactMessage do
  let(:message) do
    ContactMessage.new(
      from_email: 'example@example.com',
      from_name: 'The name',
      subject: 'The subject',
      text: 'Some text'
    )
  end

  it 'is valid' do
    expect(message).to be_valid
  end

  it 'is not valid without name' do
    message.from_name = ''
    expect(message).not_to be_valid
  end

  it 'is not valid without text' do
    message.text = ''
    expect(message).not_to be_valid
  end

  describe 'email validations' do
    it 'is not valid without email' do
      message.from_email = ''
      expect(message).not_to be_valid

      message.from_email = nil
      expect(message).not_to be_valid
    end

    it 'with incorrect email is not valid' do
      message.from_email = 'example.example.com'
      expect(message).not_to be_valid

      message.from_email = 'example@example'
      expect(message).not_to be_valid
    end

    it 'with spaces is not valid' do
      message.from_email = 'example @example.com'
      expect(message).not_to be_valid

      message.from_email = 'example@ example.com'
      expect(message).not_to be_valid
    end
  end
end
