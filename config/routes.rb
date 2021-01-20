Rails.application.routes.draw do
  devise_for :users
  root to: "definitions#index"
  resources :definitions do
    resources :answers, only: :create
    resources :comments, only: :create
  end

  resources :users, only: :show

  resources :p_definitions do
    resources :p_answers, only: :create
  end

end