Rails.application.routes.draw do
  resources :events
  get '/calendar', to: 'events#calendar'
  root "events#index"
end
