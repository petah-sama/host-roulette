Rails.application.routes.draw do
  devise_for :users


  resources :users, only: [:show]
  root to: 'pages#home'
  get 'dashboard', to: 'pages#index'
  get 'friends', to: 'pages#friends'
  get 'past-events', to: 'pages#past_events'
  get 'calendar', to: 'pages#calendar'
  get 'surveys', to: 'pages#surveys'

  resources :events, except: %i[index show] do
    resources :members, only: %i[create destroy]
    resources :event_tags, only: %i[create destroy]
    resources :editions, except: %i[index] do
      resources :guests, only: %i[create destroy] do
        resources :reviews, only: %i[create update destroy]
      end
      resources :items, only: %i[create update destroy]
      resources :questions, only: %i[create destroy] do
        resources :answers, only: %i[create update destroy]
      end
    end
  end

  get '/events/:id/join', to: 'events#join'
end
