Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get '/about' => 'homes#about'
  get '/favorites/:id' => 'posts#favorite',as: 'favorite'

  resources :books, only: [:show, :create] do
    collection do
      get :search
    end
  end

  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get :unsubscribe
      patch :withdraw
    end
  end

end
