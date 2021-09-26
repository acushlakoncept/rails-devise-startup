require 'sidekiq/web'

Rails.application.routes.draw do
  draw :madmin
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
authenticate :user, lambda { |u| u.admin? } do
  mount Sidekiq::Web => '/sidekiq'

  namespace :madmin do
  end
end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", sessions: "users/sessions" }
  root to: 'home#index'

  resource :two_factor

  devise_scope :user do 
    scope :users, as: :users do 
      post 'pre_otp', to: 'users/sessions#pre_otp'
    end 
  end

end
