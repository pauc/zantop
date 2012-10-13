def sign_in(user)
  visit login_path
  fill_in "new_session[email]",    with: user.email
  fill_in "new_session[password]", with: user.password
  click_button "login"
end
