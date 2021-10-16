class ContactMessagesController < ApplicationController
  
  def new

  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)
    if @contact_message.valid?
      UserMailer.with(contact_message: @contact_message).contact_email.deliver_now
      redirect_to root_path, notice: "Message sent! Thank you for contacting us."
    else
      render :new
    end
  end

  private
  
  def contact_message_params
    params.require(:contact_message).permit(:email, :subject, :content)
  end
end