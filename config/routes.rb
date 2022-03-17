Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'relationships/followings'
  get 'relationships/followers'
  root 'home#index'
  devise_for :users

  # ネストさせる
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
