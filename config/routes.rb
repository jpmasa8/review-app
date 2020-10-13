Rails.application.routes.draw do
  

  root 'home#index'
  resources :posts
  resources :comments, only: %i[create destroy]
end