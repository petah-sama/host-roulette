Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show] do
    resources :notifications, only: [:create, :index]
  end

  root to: 'pages#home'
  get 'dashboard', to: 'pages#index'
  get 'friends', to: 'pages#friends'
  get 'past-events', to: 'pages#past_events'
  get 'calendar', to: 'pages#calendar'
  get 'surveys', to: 'pages#surveys'

  resources :events, except: %i[index] do
    resources :members, only: %i[index create destroy]
    resources :event_tags, only: %i[create destroy]
    resources :editions, except: %i[index] do
      resources :guests, only: %i[create destroy]
      resources :reviews, only: %i[create update destroy]
      resources :items, only: %i[new create update destroy]
      resources :questions, only: %i[create show index] do
        resources :answers, only: %i[create update]
      end
    end
  end
  resources :questions, only: :destroy
  resources :answers, only: :destroy
  resources :orders, only: [:show, :create]
  delete '/notifications', to: 'notifications#destroy'
  get '/events/:id/join', to: 'events#join'
end
