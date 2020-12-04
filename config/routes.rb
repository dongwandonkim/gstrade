Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'page#home'
  get 'search_items', to: 'registered_items#search'

  resources :items

  resources :registered_items

  #redirect to /
  get '*path' => redirect('/')
end
