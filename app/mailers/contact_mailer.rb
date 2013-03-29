class ContactMailer < ActionMailer::Base
  default from: "no-reply@mireiazantop.com",
          charset: 'UTF-8'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_message.subject
  #
  def contact_message(from_email, from_name, subject, text)
    @name = from_name
    @text = text

    mail to: "pausandalio@gmail.com",
         subject: "[mireiazantop.com]: #{subject}",
         reply_to: from_email
  end
end
