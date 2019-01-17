Rails.application.routes.draw do
  resources :posts
  resources :comments
  resources :drafts
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'posts#index'
end
