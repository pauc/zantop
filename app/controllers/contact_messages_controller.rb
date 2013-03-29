#encoding: UTF-8
class ContactMessagesController < ApplicationController
  def new
    @contact_message = ContactMessage.new()
  end

  def create
    @message = ContactMessage.new(params[:contact_message])
    if @message.valid?
      ContactMailer.contact_message(@message).deliver
      flash[:notice] = "Missatge enviat correctament. Gràcies!!"
      redirect_to front_path
    else
      render action: 'new'
    end
  end
end
