Rails.application.routes.draw do
  resources :pieces do
    resources :bookings, only: [ :new, :create, :show, :update ]
  end
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [ :show ]
  get "dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
