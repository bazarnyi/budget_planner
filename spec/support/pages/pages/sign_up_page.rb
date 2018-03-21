class SignUpPage < SitePrism::Page
  set_url'users/sign_up'
  set_url_matcher %r{/users/sign_up}

  # ELEMENTS
  element :email_field,                 '#user_email'
  element :password_field,              '#user_password'
  element :password_confirmation_field, '#user_password_confirmation'

  element :submit_btn,                :xpath, '//*[@name="commit"]'

  # METHODS
  def sign_up(user)
    email_field.set user.email
    password_field.set user.password
    password_confirmation_field.set user.password
    submit_btn.click
    sleep 0.5
  end
end