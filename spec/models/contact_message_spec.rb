# frozen_string_literal: true

RSpec.describe ContactMessage do
  def build_message(attributes = {})
    described_class.new({ from_email: "example@example.com",
                          from_name: "The name",
                          subject: "The subject",
                          text: "Some text" }.merge(attributes))
  end

  describe "#initialize" do
    it "assigns the attributes it is given" do
      expect(build_message(subject: "Another subject").subject).to eq "Another subject"
    end

    it "raises for an attribute the message does not have" do
      expect { described_class.new(no_such_attribute: "x") }.to raise_error(NoMethodError)
    end
  end

  describe "#persisted?" do
    it "is always false" do
      expect(build_message).not_to be_persisted
    end
  end

  describe "validations" do
    it "accepts a complete message" do
      expect(build_message).to be_valid
    end

    it "rejects a blank name" do
      expect(build_message(from_name: "")).not_to be_valid
    end

    it "rejects a missing name" do
      expect(build_message(from_name: nil)).not_to be_valid
    end

    it "rejects a blank text" do
      expect(build_message(text: "")).not_to be_valid
    end

    it "rejects a missing text" do
      expect(build_message(text: nil)).not_to be_valid
    end

    it "does not require a subject" do
      expect(build_message(subject: "")).to be_valid
    end

    it "rejects a blank email" do
      expect(build_message(from_email: "")).not_to be_valid
    end

    it "rejects a missing email" do
      expect(build_message(from_email: nil)).not_to be_valid
    end

    it "rejects an email with no at sign" do
      expect(build_message(from_email: "example.example.com")).not_to be_valid
    end

    it "rejects an email with no top level domain" do
      expect(build_message(from_email: "example@example")).not_to be_valid
    end

    it "rejects an email with a space before the at sign" do
      expect(build_message(from_email: "example @example.com")).not_to be_valid
    end

    it "rejects an email with a space after the at sign" do
      expect(build_message(from_email: "example@ example.com")).not_to be_valid
    end
  end
end
