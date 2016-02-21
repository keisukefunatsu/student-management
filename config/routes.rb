Rails.application.routes.draw do


  resources :results
  resources :information
  root to: 'home#index'
  get 'home/index'
  get '/logout' => 'sessions#destroy'

  devise_for :users, controllers: {
   omniauth_callbacks: "users/omniauth_callbacks"
 }
  resources :users, :only => [:index, :show, :edit, :update ]

  resources :users do
    resources :results
  end
end
