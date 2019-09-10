# frozen_string_literal: true

# Main application mailer (not really used in this demo)
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
