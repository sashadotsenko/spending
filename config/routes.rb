Rails.application.routes.draw do
  devise_for :users
  resources :costs
  resources :users, only: %i[show]
  root to: 'pages#home'
  get '/auth/:provider/callback', to: 'authentications#create'
end
