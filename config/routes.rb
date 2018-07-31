Rails.application.routes.draw do
  # get 'items/index'
  # get 'items/show'
  # get 'items/new'
  # get 'items/create'
  get 'users/show'

  devise_for :users

  resources :users do
      resources :items, only: [:new, :create, :destroy]
  end

  resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  get 'welcome/about'

  root 'welcome#index'
end
