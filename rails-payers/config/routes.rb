Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  # resources :transactions
  get '/point_total', to: "transactions#point_total"
  post '/add_transaction', to: "transaction#add_transaction"

end
