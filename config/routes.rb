Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resource :register, controller: :users, only: [:new, :create]

  resource :login, controller: :sessions, only: :create
  resource :logout, controller: :sessions, only: :destroy

  get '/dashboard', to: 'users#show'
end
