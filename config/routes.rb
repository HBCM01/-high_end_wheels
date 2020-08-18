Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "myprofile", to: "pages#myprofile"   myprofile view in pages
  resources :cars, only: [ :index, :show, :new, :create, :update, :edit, :destroy ] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
end

