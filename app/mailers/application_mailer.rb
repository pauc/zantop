class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@mireiazantop.com",
          charset: 'UTF-8'
  layout 'mailer'
end
