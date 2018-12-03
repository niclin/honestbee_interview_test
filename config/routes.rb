Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :products
  end

  resources :products

  resources :premium_membership_orders, only: [:new, :create]

  get 'pricing', to: "pages#pricing"

  root 'products#index'
end
