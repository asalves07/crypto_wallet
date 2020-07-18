Rails.application.routes.draw do
  resources :mining_types
  # get 'wellcome/index'
  resources :coins

  root to: 'wellcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
