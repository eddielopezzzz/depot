Depot::Application.routes.draw do
  get "admin/index"

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  resources :users

  resources :orders
  resources :line_items
  resources :carts
  resources :products do
    get :who_bought, :on => :member
  end
  
  get "store/index"
  
  root :to => 'store#index', :as => 'store'
end
