# frozen_string_literal: true

class ContactMessagesController < ApplicationController
  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(params[:contact_message])

    if @contact_message.valid?
      ContactMailer.contact_message(@contact_message).deliver

      flash[:notice] = "Missatge enviat correctament. Gràcies!!"
      redirect_to home_path
    else
      render action: 'new'
    end
  end
end
