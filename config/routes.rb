Rails.application.routes.draw do
  resources :pieces do
    resources :bookings, only: [ :new, :create, :show, :update ]
  end
  resources :users, only: [ :show ]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
