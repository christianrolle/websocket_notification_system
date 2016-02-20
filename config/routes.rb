Rails.application.routes.draw do
  resource  :session
  root 'sessions#new'
end
