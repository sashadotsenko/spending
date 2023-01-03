Rails.application.routes.draw do
  devise_for :users
  resources :costs
  root to: 'pages#home'
end
