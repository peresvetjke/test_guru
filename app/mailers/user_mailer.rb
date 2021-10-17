class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  layout 'mailer'

  def contact_email
    @contact_message = params[:contact_message]
    mail(to: ENV['ADMIN_EMAIL'], from: @contact_message.email, subject: @contact_message.subject)
  end
end
