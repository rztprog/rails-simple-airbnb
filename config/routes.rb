Rails.application.routes.draw do
  root to: 'flats#index'
  resources :flats, only: [ :new, :create, :show, :edit, :update, :destroy ]
end
