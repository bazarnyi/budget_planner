class HomePageController < ApplicationController
  def index
    redirect_to controller: 'welcome', action: 'index' unless user_signed_in?
  end
end
