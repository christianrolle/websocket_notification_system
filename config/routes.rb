Rails.application.routes.draw do
  resource  :session
  resources :user
  root 'sessions#new'
end
