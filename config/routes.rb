Rails.application.routes.draw do
  resources :posts do
    resources :comments, shallow: true
  end
  resources :drafts
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'posts#index'
end
