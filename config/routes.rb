Rails.application.routes.draw do
  resources :charges, only: [:new, :create]

  resources :wikis, except: []

  devise_for :users

  resources :users, only: [] do
    member do
      post :downgrade
    end
  end

  root 'welcome#index'
end
