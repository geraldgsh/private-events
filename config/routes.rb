Rails.application.routes.draw do
  get 'main_page/home'
  get 'main_page/about'
  resources :users, only: [:new, :create, :show, :edit, :index, :update, :destroy]
  root 'main_page#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
