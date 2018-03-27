class SignInPage < SitePrism::Page
  set_url'users/sign_in'
  set_url_matcher %r{/users/sign_in}

  element :email_field, '#user_email'
  element :password_field, '#user_password'
  element :submit_btn, :xpath, '//*[@name="commit"]'

  def sign_in(user)
    email_field.set user.email
    password_field.set user.password
    submit_btn.click
    sleep 0.5
  end
end