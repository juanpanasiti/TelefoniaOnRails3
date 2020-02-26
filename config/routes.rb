Rails.application.routes.draw do
  resources :devices, only:[:new, :create]
  resources :offices, only:[:new, :create]
  resources :plans, only:[:new, :create]
  resources :accounts, only:[:new, :create]
  resources :form_options, only:[:new, :create]
  get 'adminzone/index'
  devise_for :admins
  root 'home#index'
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
