Todo::Application.routes.draw do
  # devise_for :users
  
  # resources :tasks, except: [:index]
  resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  root to: 'pages#home'

  get 'reports', to: 'reports#index'
  get 'logo192.png', to: 'public#logo192'
  get 'manifest.json', to: 'public#manifest'
  get '*path', to: 'public#index', constraints: ->(req) { !req.xhr? && req.format.html? }
end

