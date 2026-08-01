# frozen_string_literal: true

class ContactMessagesController < ApplicationController
  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)

    if @contact_message.valid?
      ContactMailer.contact_message(@contact_message).deliver_now

      redirect_to root_path, notice: t(".confirmation")
    else
      render :new
    end
  end

  private

  # ContactMessage#initialize assigns through send, so anything reaching it
  # unfiltered would be a setter call chosen by the visitor. Filter first.
  def contact_message_params
    params.expect(contact_message: [:from_email, :from_name, :subject, :text])
  end
end
