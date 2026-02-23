Rails.application.routes.draw do
  devise_for :users

  root "events#index"

  resources :events
  resources :users, only: [ :show ]
 resources :events do
  resources :event_attendances, only: [ :create ]
end

resources :events do
  resources :event_invitations, only: [:create]
end
end
