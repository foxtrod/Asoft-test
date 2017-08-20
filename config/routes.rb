require 'sidekiq/web'

Rails.application.routes.draw do
  root 'apps#index'

  get 'apps/' => 'apps#index'

  get 'admin/' => 'admin#edit'
  post 'admin/' => 'admin#update'

  mount Sidekiq::Web, at: '/sidekiq'
end