# frozen_string_literal: true

module SessionsHelper
  def current_user?
    !!current_user
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back(default_url = front_path)
    redirect_to(session[:return_to] || default_url)
    session.delete(:return_to)
  end
end
