Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  # resources :transactions
  resources :users, only: [:create, :show, :index]
  resources :payers, only: [:create, :show, :index]
  resources :transactions, only: [:show, :index]
  post '/spend_points', to: "transactions#spend_points"
  post '/add_transaction', to: "transactions#add_transaction"

end
