Rails.application.routes.draw do
  root to: 'flats#index'

  resources :flats, only: [ :new, :show, :create ]
end
