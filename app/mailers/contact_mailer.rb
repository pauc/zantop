class ContactMailer < ActionMailer::Base
  default from: "no-reply@mireiazantop.com",
          charset: 'UTF-8'

  def contact_message(message)
    @name = message.from_name
    @text = message.text
    recipient = Rails.env == "production" ? "hola@mireiazantop.com" : "pausandalio@gmail.com"

    mail to: recipient,
         subject: "[mireiazantop.com]: #{message.subject}",
         reply_to: message.from_email
  end
end
