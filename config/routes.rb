Rails.application.routes.draw do
  devise_for :users

  namespace :user do
    root to: "pages#index"
  end

  resources :users, only: [:show]
  root to: 'pages#home'
  get 'dashboard', to: 'pages#index'
  get 'friends', to: 'pages#friends'
  get 'past-events', to: 'pages#past_events'
  get 'calendar', to: 'pages#calendar'
  get 'surveys', to: 'pages#surveys'

  resources :events, except: %i[index] do
    resources :members, only: %i[create destroy]
    resources :event_tags, only: %i[create destroy]
    resources :editions, except: %i[index] do
      resources :guests, only: %i[create destroy] do
        resources :reviews, only: %i[create update destroy]
      end
      resources :items, only: %i[new create update destroy]
      resources :questions, only: %i[create show] do
        resources :answers, only: %i[create update]
      end
    end
  end
  resources :questions, only: :destroy
  resources :answers, only: :destroy

  get '/events/:id/join', to: 'events#join'
end
