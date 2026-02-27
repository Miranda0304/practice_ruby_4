Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      # USERS
      resources :users, only: %i[index show create update destroy] do
        patch :inactive
      end

      # POSTS
      resources :posts, only: %i[index show create update destroy] do
        patch :soft_delete
      end

      # COMMENTS
      resources :comments, only: %i[index create update destroy] do
        patch :soft_delete
      end

      resources :post_likes, only: %i[create destroy]
    end
  end
end
