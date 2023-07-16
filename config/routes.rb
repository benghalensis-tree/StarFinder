Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :posts do
    collection do
      get 'map'
    end
  end
  resources :favorites, only:[:create, :destroy]
  root 'posts#map'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
