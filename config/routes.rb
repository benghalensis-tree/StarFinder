Rails.application.routes.draw do
  resources :posts
  root 'posts#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
