Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  get 'welcome/index'
  resources :articles
  root 'articles#index'

end
