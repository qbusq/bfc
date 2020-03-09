Rails.application.routes.draw do
  devise_for :users
  resources :user do
    resources :company_certificates, only: [:new, :create, :destroy]
    collection do
      get 'my_products'
    end
  end
  root to: 'pages#home'
  resources :offers do
    get 'c_offers', to: 'offers#new_offer'
    post 'c_offers', to: 'offers#create_offer'

    resources :offer_lines, only: [:new, :create, :index, :destroy]
    resources :offers
    collection do
      get 'offers_requested'
      get 'offers_received'
      get 'contracts'
    end
  end
  resources :products do
    resources :product_certificates, only: [:new, :create, :destroy]
  end

  get '/charts', to: 'charts#display_chart'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
