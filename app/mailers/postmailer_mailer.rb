# frozen_string_literal: true

class PostmailerMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.postmailer_mailer.post_created.subject
  #
  def post_created
    @greeting = 'Hi'

    mail to: 'to@example.org'
  end
end
