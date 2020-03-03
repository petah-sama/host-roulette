Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'


  resources :events do
    resources :members, only: %i[index new create destroy]
    resources :event_tags, only: %i[create destroy]
    resources :editions do
      resources :guests, only: %i[index new create destroy] do
        resources :reviews, only: %i[create update]
      end
      resources :items, only: %i[create destroy]
      resources :questions, only: %i[create] do
        resources :answers, only: %i[create]
      end
    end
  end
end
