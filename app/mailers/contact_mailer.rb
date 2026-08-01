# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  # The site owner's mailbox, the only address the contact form ever writes to.
  # Not environment-dependent: development and test never reach a real SMTP
  # server, so there is nothing to protect against by rewriting it there.
  RECIPIENT = "hola@mireiazantop.com"

  def contact_message(message)
    @name = message.from_name
    @text = message.text

    mail to: RECIPIENT,
         subject: "[mireiazantop.com]: #{message.subject}",
         reply_to: message.from_email
  end
end
