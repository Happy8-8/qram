Rails.application.routes.draw do
  devise_for :consumers
  devise_for :dealers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cars#index'
  resources :cars do
    resources :descriptions, only: :create
    resources :reviews, only: :create
    resources :photos, only: :create
  end
  resources :dealers, only: :show
  resources :consumers, only: :show
end
