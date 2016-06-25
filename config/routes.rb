Rails.application.routes.draw do
  resources :menus
  resources :pages
  mount Ckeditor::Engine => '/ckeditor'
  resources :slides
  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'user/pages#index'

  get 'collections' => 'user/pages#collections'
  get 'new_arrivals' => 'user/pages#new_arrivals'
  get 'sales' => 'user/pages#sales'
  get 'accessories' => 'user/pages#accessories'
  get 'contact' => 'user/pages#contact'
  get 'about_us' => 'user/pages#about_us'

  namespace :admin do
    post '/backend_menus/ajax_update_position' => 'backend_menus#ajax_update_position'
    post '/products/delete_image' => 'products#delete_image'

    resources :users
    resources :products
    resources :suppliers
    resources :categories
    resources :backend_menus
    resources :slides
    resources :stores
    resources :pages
    resources :menus
  end

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
