# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def contact_message(message)
    @name = message.from_name
    @text = message.text
    # recipient = Rails.env == "production" ? "hola@mireiazantop.com" : "pausandalio@gmail.com"
    recipient = "erb.devs@gmail.com"

    mail to: recipient,
         subject: "[mireiazantop.com]: #{message.subject}",
         reply_to: message.from_email
  end
end
