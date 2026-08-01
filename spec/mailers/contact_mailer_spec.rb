# frozen_string_literal: true

RSpec.describe ContactMailer do
  describe "#contact_message" do
    let(:message) do
      ContactMessage.new(from_email: "example@example.com",
                         from_name: "The name",
                         subject: "The subject",
                         text: "Some text")
    end

    let(:mail) { described_class.contact_message(message) }

    it "prefixes the subject with the site name" do
      expect(mail.subject).to eq "[mireiazantop.com]: The subject"
    end

    it "goes to the site owner" do
      expect(mail.to).to eq ["erb.devs@gmail.com"]
    end

    it "replies to the sender" do
      expect(mail.reply_to).to eq ["example@example.com"]
    end

    it "names the sender in the body" do
      expect(mail.body).to include "The name"
    end

    it "includes the text in the body" do
      expect(mail.body).to include "Some text"
    end
  end
end
