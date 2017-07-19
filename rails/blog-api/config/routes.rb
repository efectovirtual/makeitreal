Rails.application.routes.draw do
  get 'orders/app/controllers/api/v1'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :articles
      end
    end
  end
end
