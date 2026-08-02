# frozen_string_literal: true

class ContactMessagesController < ApplicationController
  include Authorization

  allow_anonymous :new, :create

  # Unlike DashboardsController#about, a page missing the requested locale
  # raises no warning here. The form is what this page is for and it is
  # translated; falling back to Catalan for the paragraph introducing it is not
  # worth telling a visitor the page is not in their language.
  def new
    @contact_message = ContactMessage.new
    @page = Page.contact
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)

    if @contact_message.valid?
      ContactMailer.contact_message(@contact_message).deliver_now

      redirect_to root_path, notice: t(".confirmation")
    else
      # `render :new` renders the template without running #new, so the page
      # above the form has to be loaded again for it.
      @page = Page.contact

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
