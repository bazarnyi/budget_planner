class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def auth_user
    redirect_to controller: 'welcome', action: 'index' unless user_signed_in?
  end
end
