Rails.application.routes.draw do
  resources :lines, except:[:show, :destroy]
  resources :users, only:[:index, :new, :create]
  resources :devices, only:[:index, :new, :create]
  resources :offices, only:[:new, :create]
  resources :device_models, only:[:new, :create]
  resources :csv_report_lines, only:[:new, :create], as: :reports
  resources :plans, only:[:new, :create]
  resources :accounts, only:[:new, :create]
  resources :form_options, only:[:new, :create]
  get 'adminzone/index'
  devise_for :admins
  root 'home#index'
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
