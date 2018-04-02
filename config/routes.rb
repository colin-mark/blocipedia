Rails.application.routes.draw do
  resources :wikis, except: []

  devise_for :users

  root 'welcome#index'
end
