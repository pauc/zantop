# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # `set_current_user` runs before everything else, including the
  # `authorize_admin` filter the `Authorization` concern appends in each
  # controller: every query an action makes is scoped by who is asking, so the
  # answer has to be in place before any of them runs.
  before_action :set_current_user,
                :set_locale,
                :set_tags

  before_action do
    ActiveStorage::Current.url_options = { host: request.host }
  end

  around_action :set_locale_from_url
  helper_method :current_user, :current_user?

  private

  def set_current_user
    Current.user = current_user
  end

  def set_locale
    locale = params[:locale]

    return if locale && I18n.available_locales.map(&:to_s).include?(locale)

    location = request.fullpath

    redirect_to "/#{locale_from_headers}#{location}"
  end

  def set_tags
    @enabled_tags = Tag.enabled.includes(:plain_text_translations)
  end

  # `find_by`, not `find`: a session cookie outliving the user it names is an
  # anonymous visitor, not a server error. It used to raise, which only showed
  # up on pages that rendered the layout; now that `set_current_user` asks on
  # the way into every request, raising here would take the public site down
  # for anyone holding a stale cookie.
  def current_user
    return @current_user if defined?(@current_user)

    @current_user = session[:user_id] && User.find_by(id: session[:user_id])
  end

  def current_user?
    !!current_user
  end

  # Remembers where a visitor was turned away from so that signing in lands
  # them back there. Only a GET is worth remembering: a form post cannot be
  # replayed by a redirect, and the page it was sent from is the better place
  # to come back to anyway.
  def store_location
    session[:return_to] = request.fullpath if request.get?
  end

  # Reading the stored location consumes it — it is good for the one redirect
  # that follows the login, not for every login afterwards.
  def stored_location
    session.delete(:return_to)
  end

  def locale_from_headers
    return I18n.default_locale unless (header = request.headers["HTTP_ACCEPT_LANGUAGE"])

    AcceptLanguage
      .parse(header)
      .match(*I18n.available_locales) || I18n.default_locale
  end
end
