Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :articles
  root 'articles#index'

end
