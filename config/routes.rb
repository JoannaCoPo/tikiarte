Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resource :register, controller: :users, only: [:new, :create]

  get '/dashboard', to: 'users#show'
end
