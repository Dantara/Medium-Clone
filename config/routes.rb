Rails.application.routes.draw do
  post 'comment/create/:id', to: "comment#create", as: :comment_create
  get 'post/new'
  get 'home/index'
  post 'post/create'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "home#index"

  delete 'post/:id', to: "post#destroy", as: :post_destroy
  get 'post/:id', to: 'post#show', as: :post_show
  get 'draft/:id', to: 'draft#show', as: :draft_show
  get 'drafts', to: 'home#drafts', as: :drafts
  patch 'post/update/:id', to: "post#update", as: :post_update
end
