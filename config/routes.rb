Rails.application.routes.draw do

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :articles
  get 'welcome/index'
  root 'articles#index'
  # get 'company_info/index'
	# This line mounts Forem's routes at /forums by default.
	# This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
	# If you would like to change where this extension is mounted, simply change the :at option to something different.
	#
	# We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
	mount Forem::Engine, :at => '/forums'

  comfy_route :cms_admin, :path => '/admin'
  comfy_route :blog_admin, :path => '/admin'
  comfy_route :blog, :path => '/blog'


  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => true


end
