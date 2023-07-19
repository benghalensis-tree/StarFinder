Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :my_pages, only:[:show, :edit, :update]
  resources :favorites, only:[:create, :destroy, :show]
  resources :posts do
    resources :comments
    collection do
      get 'map'
      get 'search'
    end

  end
  
  root 'posts#map'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
