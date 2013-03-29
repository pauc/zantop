class ContactMailer < ActionMailer::Base
  default from: "no-reply@mireiazantop.com",
          charset: 'UTF-8'

  def contact_message(message)
    @name = message.from_name
    @text = message.text

    mail to: "pausandalio@gmail.com",
         subject: "[mireiazantop.com]: #{message.subject}",
         reply_to: message.from_email
  end
end
