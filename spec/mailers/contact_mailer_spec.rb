require 'spec_helper'

describe ContactMailer do

  let( :message) do
    ContactMessage.new(from_email: 'example@example.com',
                       from_name: 'The name',
                       subject: 'The subject',
                       text: 'Some text')
  end

  let(:mail) { ContactMailer.contact_message( message ) }

  it 'renders the subject' do
    mail.subject.should == "[mireiazantop.com]: #{message.subject}"
  end

  it 'contains the sender name if exists' do
    mail.body.should include message.from_name
  end

  it 'contains the text' do
    mail.body.should include message.text
  end
end
