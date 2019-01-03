Rails.application.routes.draw do
  get 'post/new'
  get 'home/index'
  post 'post/create'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "home#index"
end
