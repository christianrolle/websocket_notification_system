Rails.application.routes.draw do
  root 'sessions#new'

  resource  :session
  resources :users
  resources :relationships
  resources :projects
  resources :project_likes

  mount ActionCable.server => "/cable"
end
