# frozen_string_literal: true

# Controller specs put the user id straight into the session rather than
# posting the login form: what they are about is what an action does once
# somebody is signed in, not the signing in itself, which sessions_controller_spec
# covers on its own.
module Authentication
  def sign_in(user = create(:user))
    session[:user_id] = user.id

    user
  end
end

# Request specs have no session to write to, so they go through the form. It
# answers with a redirect, which keeps the layout — and the asset bundles it
# needs, absent in CI — out of the way.
module RequestAuthentication
  def sign_in(user = create(:user))
    post session_path(locale: :ca),
         params: { session: { email: user.email, password: "secret" } }

    user
  end
end

RSpec.configure do |config|
  config.include Authentication, type: :controller
  config.include RequestAuthentication, type: :request
end
