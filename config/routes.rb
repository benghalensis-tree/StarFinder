Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :posts
  root 'posts#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
