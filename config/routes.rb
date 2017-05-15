Rails.application.routes.draw do

  resources :apartments

  resources :blocks

  resources :floors

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
