Rails.application.routes.draw do
  root "users#index"
  #User routes
 
  get "users" => "users#index"

  get "users/new" => "users#new"

  post "users" => "users#create"

  get "users/edit" => "users#edit"

  get "users/:id" => "users#show"

  patch "users/:id" => "users#update"

  delete "users/:id" => "users#destroy"

  #Sessions is for login and logout
  post 'sessions/create_login_user' => "sessions#create_login_user"

  get 'sessions/logout' => "sessions#logout"

  #Brightidea routes


  get 'brightideas' => 'brightideas#index'

  post 'brightideas' => 'brightideas#create'

  post 'brightideas/like/:id' => 'brightideas#like'

  delete 'brightideas/unlike/:id' => 'brightideas#unlike'

  get 'brightideas/:id' => 'brightideas#show'

  delete 'brightideas/:id' => 'brightideas#destroy'

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
