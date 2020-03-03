Rails.application.routes.draw do
  devise_for :users
  resources :user do
    resources :company_certificates, only: [:new, :create, :destroy]
  end
  root to: 'pages#home'
  resources :offers, except: [:edit, :update] do
    resources :offer_lines, only: [:new, :create, :index, :destroy]
    resources :offers, except: [:edit, :update]
  end
  resources :products do
    resources :product_certificates, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
