class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  layout 'mailer'
  
  ADMIN_EMAIL = 'master.testg2394@gmail.com'

  def contact_email
    @contact_message = params[:contact_message]
    mail(to: ADMIN_EMAIL, from: @contact_message.email, subject: @contact_message.subject)
    # mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
