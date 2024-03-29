FastShoppy::Application.routes.draw do

  resources :big_deals

	devise_for :users
  # Redirect to root if 404
  	get '404', to: redirect('/')

resources :users do
	resources :stores do
		resources :products
	end
end

resources:subscribers ,:only => [:new,:create,:destroy,:update]

resources :products do
  resources :product_images
end
resources :products do
	resources :reviews
end

 mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
	root :to => 'home#index'
	resources :plans
	get "/store/:id" => 'home#store_catalogue', :as => 'store_search_show'
	get "/:owner_name/:id" => 'home#product_show', :as => 'product_search_show'
	get	"/store/:id/analytics" => 'stores#analytics', :as => 'store_analytics'
	get	"/store/:id/featured_analytics" => 'stores#featured_analytics', :as => 'featured_analytics'
	get '/products/:id/status', :to => "products#toggled_feature"
	put '/plans/', :to => "plans#plan_update", :as => 'plan_update'
	post '/home/:product_id', :to => "home#create", :as => 'add_to_compare'
	delete '/home/:product_id', :to => "home#destroy", :as => 'empty_compare'
	get 'compare_product', :to => "home#compare_product", :as => 'compare_products'

  get 'productlists', :to => "home#productlists"

  get 'subscribers/validations/check_email', :to=>"subscribers#check_email"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
