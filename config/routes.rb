Rails.application.routes.draw do
  get '/message/:from_id' => 'messaging#conversation', as: 'conversation'
	get '/messages' => 'messaging#index', as: 'messages'
	post '/message/:to_id' => 'messaging#send_message', as: 'send_message'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  devise_for :users, :controllers => { :registrations => "profile", :omniauth_callbacks => "users/omniauth_callbacks"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :homepage
  patch '/homepage/:user_id' => "homepage#update", as: "homepage_update"
  get 'api/users' => "api#getuser", as: "api_users"
  get 'activity/:user_id' => "activity#show", as: "activity_user"
  get 'activity/:user_id' => "activity#index", as: "activity"

  devise_scope :user do
    patch '/users/:id' => "profile#update_profile", as: "user"
    get 'users/:id/edit_profile' => "profile#edit_profile", as: "edit_profile"
    get 'users/:id/show' => "profile#show", as: "user_profile"

		get '/users/:id/follower' => "profile#follower", as: "user_follower"
		get '/users/:id/following' => "profile#following", as: "user_following"
    post '/updatelocation' => "homepage#update_location"

    resources :user do
      resources :posts
      post 'follow/:current_user_id', to: 'socializations#togglefollow'
      post 'unfollow', to: 'socializations#unfollow'
      get 'follow/:current_user_id', to: 'socializations#toggle'
      resources :status
    end
  end


  # You can have the root of your site routed with "root"
   root 'homepage#index'

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
