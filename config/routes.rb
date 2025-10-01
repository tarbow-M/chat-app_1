Rails.application.routes.draw do
  get 'messages/index'
  root to: "messages#index"
  # Userモデルに対してDeviseの全てのルーティングを定義する
  devise_for :users
  resources :users, only: [:edit, :update]
end
