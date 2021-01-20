Rails.application.routes.draw do
  devise_for :users

  root 'page#home'
  get 'search_items', to: 'registered_items#search'

  resources :items

  resources :registered_items, only: [:new, :edit, :create, :update, :delete]
  #/users/id/registereditem/id
  #/myregistereditems

  resources :users do
    resources :registered_items, only: [:index, :show]
  end

  #redirect to /
  get '*path' => redirect('/')
end
