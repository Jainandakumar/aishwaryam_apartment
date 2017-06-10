Rails.application.routes.draw do

  resources :apartments

  post 'blocks/create_block', to: 'blocks#create_block'

  resources :blocks

  post 'floors/create_floor', to: 'floors#create_floor'

  resources :floors

  post 'flats/create_flat', to: 'flats#create_flat'

  resources :flats

  authenticated :user do
    root to: 'apartments#index', as: :authenticated_root
  end
  
  # for unauthenticated user 
  root to: redirect('/users/sign_in')

  devise_scope :user do 
    get "users/sign_out", to: "devise/sessions#destroy"
  end

  devise_for :users

end
