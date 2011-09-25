Depot::Application.routes.draw do
  get "store/index"
  
  resources :line_items
  resources :carts
  resources :products

  #root :to => "store#index"
  
  root :to => 'store#index', :as => 'store'
end
