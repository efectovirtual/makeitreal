Rails.application.routes.draw do
  devise_for :users
  resources :collections
  # resources :invoices, except: ['new']
  # resources :invoices, only: ['new']
  resources :invoices
  resources :users
  get '/search', to: 'index#search'
  get 'products', to: 'products#index'
  get 'products/new', to: 'products#new'
  post 'products', to: 'products#create'

  get 'holi/crear'

  get 'holi/actualizar'
  # get 'holi/products', as: 'products'

  get 'holi/ver(/:name)', to: 'holi#ver', as: 'yepeto'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'index', to: 'index#holi'
  get 'index' => 'index#index'
  root 'index#index'
end
