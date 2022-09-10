# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale,
                :set_tags

  before_action do
    ActiveStorage::Current.url_options = { host: request.host }
  end

  around_action :set_locale_from_url
  helper_method :current_user, :current_user?

  private

  def set_locale
    locale = params[:locale]

    return if locale && I18n.available_locales.map(&:to_s).include?(locale)

    location = request.fullpath

    redirect_to "/#{locale_from_headers}#{location}"
  end

  def set_tags
    @enabled_tags = Tag.enabled.includes(:plain_text_translations)
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def current_user?
    !!current_user
  end

  def locale_from_headers
    return I18n.default_locale unless (header = request.headers["HTTP_ACCEPT_LANGUAGE"])

    AcceptLanguage
      .parse(header)
      .match(*I18n.available_locales) || I18n.default_locale
  end
end
