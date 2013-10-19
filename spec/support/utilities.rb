def sign_in(user)
  visit login_path
  fill_in "new_session[email]",    with: user.email
  fill_in "new_session[password]", with: user.password
  click_button "login"
  user
end

def fill_in_ckeditor(fieldset, opts)
  browser = page.driver.browser
  content = opts.fetch(:with).to_json
  page.execute_script("var locator = $('.#{fieldset}').find('textarea').first().attr('id'); CKEDITOR.instances[locator].setData(#{content}); $('textarea#' + locator).text(#{content});")
end
