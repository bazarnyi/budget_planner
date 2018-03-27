Rails.application.routes.draw do
  devise_for :users

  root 'home_page#index'
  resources :home_page
  resources :welcome

end
