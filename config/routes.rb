Rails.application.routes.draw do
  get 'calculates/new'
  get 'calculates/create'

  post 'calculates/create' => 'calculates#create'

  root to: 'calculates#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
