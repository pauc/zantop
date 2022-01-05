require 'rails_helper'

RSpec.describe ContactMailer do

  let( :message) do
    ContactMessage.new(from_email: 'example@example.com',
                       from_name: 'The name',
                       subject: 'The subject',
                       text: 'Some text')
  end

  let(:mail) { ContactMailer.contact_message( message ) }

  it 'renders the subject' do
    expect(mail.subject).to eq("[mireiazantop.com]: #{message.subject}")
  end

  it 'contains the sender name if exists' do
    expect(mail.body).to include(message.from_name)
  end

  it 'contains the text' do
    expect(mail.body).to include(message.text)
  end
end
