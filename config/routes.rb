Rails.application.routes.draw do
  get 'messages/index'
  # root to: "messages#index"
  root to: "rooms#index"
  # Userモデルに対してDeviseの全てのルーティングを定義する
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end
