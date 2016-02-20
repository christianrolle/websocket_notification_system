Rails.application.routes.draw do
  resource  :session
  resource  :user
  root 'sessions#new'
end
