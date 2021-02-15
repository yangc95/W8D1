Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create]

  resources :comments, only: [:create]

  resources :subs  

  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end

  resource :session, only: [:new, :create, :destroy]
end
