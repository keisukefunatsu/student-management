Rails.application.routes.draw do

  resources :results , :except => [:show]
  resources :information
  resources :tickets
  resources :timecards
  resources :admin

  post '/come' => 'timecards#come'
  post '/out' => 'timecards#out'

  root to: 'home#index'
  get '/logout' => 'sessions#destroy'



  devise_for :users, controllers: {
   omniauth_callbacks: "users/omniauth_callbacks"
 }
  resources :users, :only => [:index, :show, :edit, :update ]

  resources :users do
    resources :results
  end

  resources :users do
    resources :timecards
  end

  resources :information do
    resources :tickets
  end
end
