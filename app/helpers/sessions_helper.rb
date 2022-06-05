module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_out
    session[:user_id] = nil
    self.current_user = nil
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back(default_url = front_path)
    redirect_to(session[:return_to] || default_url)
    session.delete(:return_to)
  end
end
