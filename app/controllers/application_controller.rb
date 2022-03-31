# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  helper_method :current_user, :current_user?

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def current_user?
    !!current_user
  end
end
