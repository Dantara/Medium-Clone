Rails.application.routes.draw do
  resources :posts, except: [:show] do
    resources :comments, shallow: true
  end
  resources :posts, only: [:show], param: :post_id
  resources :drafts
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'posts#index'
end
