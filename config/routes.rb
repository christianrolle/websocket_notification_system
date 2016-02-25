Rails.application.routes.draw do
  root 'sessions#new'

  resource  :session
  resources :users
  resources :relationships

  mount ActionCable.server => "/cable"
end
