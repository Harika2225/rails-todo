Rails.application.routes.draw do
  root to: 'pages#home'
  resources :tasks, except: [:index] do
    # get 'new', to: 'tasks#new', format: :js
  end
end
