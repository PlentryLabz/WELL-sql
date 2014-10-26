require 'sidekiq/web'
Rails.application.routes.draw do
  resource :base, only: [:show]
  root to: 'base#show'

  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resource :profile, only: [:show, :update]

      resource :upload, only: [:create]
    end
  end

  get "/web/*id" => 'web#show', as: :web, format: false

  mount Sidekiq::Web, at: "/sidekiq"
end