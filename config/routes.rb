Rails.application.routes.draw do

  root 'home#index'

  get    'login',  to: 'session#new'
  post   'login',  to: 'session#create'
  delete 'logout', to: 'session#destroy'

  get 'cart/index'
  get 'cart/add'

  get 'cart/step1'
  get 'cart/step2'
  post 'cart/step2', to: 'cart#step2_submit'
  get 'cart/step3'
  post 'cart/step3', to: 'cart#step3_submit'
  get 'cart/step4'
  get 'cart/step5'

  get 'inquiry',    to: 'home#inquiry'
  get 'my_info',    to: 'home#my_info'
  get 'my_orders',  to: 'home#my_orders'
  get 'search',     to: 'home#search'
  get 'create_account',     to: 'home#create_account'

  resources :users
  resources :categories
  resources :items
  resources :orders
  resources :order_details


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
