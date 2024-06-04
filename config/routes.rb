Todo::Application.routes.draw do
  devise_for :users

  # resources :tasks, except: [:index]
  resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  
  root to: 'pages#home'
end