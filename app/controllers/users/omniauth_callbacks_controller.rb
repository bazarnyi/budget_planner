class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    oauth 'github'
  end

  def google_oauth2
    oauth 'google_oauth2'
  end

  def oauth(provider)
    user = User.from_omniauth(request.env["omniauth.auth"])

    if user.persisted?
      sign_in user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}") if is_navigational_format?
      redirect_to root_path
    else
      session["devise.#{provider}_data"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end