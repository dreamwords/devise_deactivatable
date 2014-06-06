Rails.application.routes.draw do
  devise_for :users
  mount Devise::Oauth2Providable::Engine => '/oauth2'
  resources :projects
  
  root :to => 'home#index'
end