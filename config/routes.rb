Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :my_pages, only:[:show, :edit, :update]
  resources :favorites, only:[:create, :destroy, :show]
  resources :posts do
    resources :comments
    collection do
      get 'top'
    end
  end
  
  root 'posts#top'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
