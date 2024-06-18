Rails.application.routes.draw do
  root 'blogs#index'
  resources :blogs do
    member do
      post 'favorite', to: 'favorites#create'
      delete 'unfavorite', to: 'favorites#destroy'
    end
  end
  devise_for :users
end

