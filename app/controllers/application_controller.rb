class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :set_locale
  before_filter :set_locale_from_url
  before_filter { check_tags_translations if current_user? }

  private

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
      translated = true
      Tag.all.take_while do |tag|
        translated = tag.translations.size == 3
      end
      unless translated
        flash.now['error'] = "Tens tags pendents de traduir."
      end
    end
end
