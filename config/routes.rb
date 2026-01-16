Rails.application.routes.draw do
  get "users/index"
  get "users/show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  scope path: "/api", defaults: { format: :json } do
    # users
    resources :users, only: [ :create ] do
      # member do
      #   get :profile
      # end

      collection do
        post :login
      end
    end

    # categories
    resources :categories, only: [ :create, :index, :show, :update, :destroy ]

    # Expense
    resources :expenses, only: [ :index, :show, :create, :update, :destroy ]
  end
end
