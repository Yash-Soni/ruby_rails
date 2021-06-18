Rails.application.routes.draw do

  devise_for :users
  get 'gallery/index'
  get 'gallery/checkout'
  post 'gallery/checkout'

  get 'gallery/purchase_complete'

  get "/gallery/search"
  post "/gallery/search"

  resources :orders
  resources :line_items
  resources :carts
  get 'admin/login'
  post 'admin/login'

  get 'admin/logout'

  resources :stores

  
  # get 'users/sign_out'

  get 'home/index'
  
  # root to:'home#index'    #No extra space between the to and :

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
