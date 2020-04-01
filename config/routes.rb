Rails.application.routes.draw do
  resources :lines, except:[:show, :destroy]
  resources :users, except:[:show, :destroy]
  resources :ip_phones, except:[:show, :destroy]
  resources :devices, except:[:show, :destroy]
  resources :offices, except:[:show, :destroy]
  resources :internals, except:[:show, :destroy]
  resources :telephone_switches, except:[:show, :destroy]
  resources :form_options, except:[:show, :destroy]
  resources :device_models, only:[:new, :create]
  resources :csv_report_lines, only:[:new, :create, :show], as: :reports
  resources :plans, only:[:new, :create]
  resources :accounts, only:[:new, :create]
  get 'adminzone/index'
  devise_for :admins
  root 'home#index'
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
