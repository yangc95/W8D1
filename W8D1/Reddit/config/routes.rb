Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create]

  resources :subs  
  resources :posts, except: [:index]

  resource :session, only: [:new, :create, :destroy]
end
