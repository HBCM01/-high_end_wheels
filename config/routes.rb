Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "myprofile", to: "pages#myprofile"   myprofile view in pages
  resources :cars, only: [ :index, :show, :new, :create, :update, :edit, :destroy ] do
    resources :bookings, only: [:new, :create, :show]
  end
  resources :bookings, only: [:destroy]
  get "/my_profile", to: "pages#my_profile", as: :my_profile
  get "/my_booking_requests", to: "pages#my_booking_requests", as: :my_booking_requests
  resources :bookings, only: [:show] do
    resources :reviews, only: [:new, :create]
  end
end

