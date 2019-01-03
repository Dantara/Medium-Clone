Rails.application.routes.draw do
  get 'post/new'
  get 'home/index'
  post 'post/create'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "home#index"

  delete 'post/:id', to: "post#destroy", as: :post_destroy
  get 'post/:id', to: 'post#show', as: :post_show
  get 'draft/:id', to: 'post#show_draft'
end
