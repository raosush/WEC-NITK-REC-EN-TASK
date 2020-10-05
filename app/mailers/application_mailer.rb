class ApplicationMailer < ActionMailer::Base
  # The gmail address specified here will be used to send emails to recipients.
  default from: Rails.application.credentials.email[:username]
end
