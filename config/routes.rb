Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'home_page#index'
  resources :home_page
  resources :welcome
  resources :transactions

end
