Rails.application.routes.draw do
  devise_for :users
  resources :user do
    resources :company_certificates, only: [:new, :create, :destroy]
    collection do
      get 'my_products'
    end
  end
  root to: 'pages#home'
  resources :offers, except: [:edit, :update] do
    resources :offer_lines, only: [:new, :create, :index, :destroy]
    resources :offers, except: [:edit, :update]
    collection do
      get 'offers_requested'
      get 'offers_received'
      get 'contracts'
    end
  end
  resources :products do
    resources :product_certificates, only: [:new, :create, :destroy]
  end

  get '/charts/:id', to: 'charts#display_chart', as: :compare_chart
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
