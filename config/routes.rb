require 'sidekiq/web'

Rails.application.routes.draw do
  # root 'apps#index'
  # resources :apps, only: [:index]

  # scope 'admin' do
  #   resource :refresher, only: [:edit, :update]
  #   root 'refreshers#edit'
  # end

  get 'apps/' => 'apps#index'

  mount Sidekiq::Web, at: '/sidekiq'
end