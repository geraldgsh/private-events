Rails.application.routes.draw do
  get 'main_page/home'
  get 'main_page/about'
  resources :users, only: [:new, :create, :show, :edit, :index, :update, :destroy]
  root 'main_page#home'
  get  '/signup',  to: 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :events, only: [:new, :create, :show, :index]
end
