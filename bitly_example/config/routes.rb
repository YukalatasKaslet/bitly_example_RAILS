Rails.application.routes.draw do
  #Esto lo generó automaticamente al generar el controlador y sus acciones
  #NO es lo mismo que si ponemos resources :users
  #En ninguna ruta se pasa como parámetro el id 
      # get 'users/index'
        #  users_index GET    /users/index(.:format)   users#index
      # get 'users/create'
        # users_create GET    /users/create(.:format)  users#create
      # get 'users/new'
        #    users_new GET    /users/new(.:format)     users#new
      # get 'users/edit'
        #   users_edit GET    /users/edit(.:format)    users#edit
      # get 'users/show'
        #   users_show GET    /users/show(.:format)    users#show
      # get 'users/update'
        # users_update GET    /users/update(.:format)  users#update
      # get 'users/delete'    #<--- Aquí debía ser DESTROY y no DELETE
        # users_delete GET    /users/delete(.:format)  users#delete
  get 'welcome/index'
 


 
 
 
 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'urls#new'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  
  get  'profile'  => 'users#profile'
  get  'signup' => 'users#new'
  #get  'login'  => 'users#login'
  #post 'login'  => 'users#login'
  #get  'logout' => 'users#logout'

  resources :users, :except => [:index, :new, :show]
    #     users GET    /users(.:format)          users#profile
    #    signup POST   /signup(.:format)         users#signup
    #    logout GET    /logout(.:format)         users#logout
    #     login GET    /login(.:format)          users#login
    #           POST   /login(.:format)          users#login
    #  new_user GET    /users/new(.:format)      users#new
    # edit_user GET    /users/:id/edit(.:format) users#edit
    #      user PATCH  /users/:id(.:format)      users#update
    #           PUT    /users/:id(.:format)      users#update
    #           DELETE /users/:id(.:format)      users#destroy
      
  
  resources :urls
    get ':short_url' => 'urls#short_url'
    #resources :urls genera
     #     urls GET    /urls(.:format)          urls#index
     #          POST   /urls(.:format)          urls#create
     #  new_url GET    /urls/new(.:format)      urls#new
     # edit_url GET    /urls/:id/edit(.:format) urls#edit
     #      url GET    /urls/:id(.:format)      urls#show
     #          PATCH  /urls/:id(.:format)      urls#update
     #          PUT    /urls/:id(.:format)      urls#update
     #          DELETE /urls/:id(.:format)      urls#destroy
     
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
