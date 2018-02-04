Rails.application.routes.draw do

  devise_for :views
  devise_for :users
  root 'articles#index'

  resources :articles
end
