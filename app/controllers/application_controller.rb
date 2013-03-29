#encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :set_locale
  before_filter :set_locale_from_url
  before_filter { check_tags_translations if current_user? }

  expose (:tags) { Tag.enabled.order("taggings_count DESC").includes(:translations) }

  def send_email
    deliver_message
    flash[:notice] = "Missatge enviat correctament. Gràcies!!"
    redirect_to front_path
  end

  private

  def deliver_message
    from_email = params[:from_email]
    from_name = params[:from_name]
    subject = params[:subject]
    text = params[:text]
    ContactMailer.contact_message(from_email, from_name, subject, text).deliver
  end

  VALID_LOCALES = ['es', 'ca', 'en']
  def set_locale
    locale = params[:locale]
    if !(locale.present? and VALID_LOCALES.include?(locale))
      location = request.fullpath
      locale = request.compatible_language_from(VALID_LOCALES) || I18n.default_locale
      location = '/' + locale.to_s + location
      redirect_to location
    end
  end

  def check_tags_translations
    unless Tag.all_translated? or request.path == admin_tags_path
      flash.now['error'] = "Tens tags pendents de traduir. <a href='#{url_for controller: 'tags', action: 'admin'}'>Administrar tags</a>".html_safe
    end
  end
end
