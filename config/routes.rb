Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: "definitions#index"
  post '/definitions/guest_sign_in', to: 'definitions#new_guest'
  resources :definitions do
    resources :answers do
      resource :likes, only: [:create, :destroy]
    end
    resources :reviews, only: [:index, :create, :new]
  end

  resources :users 

  resources :p_definitions do
    resources :p_answers do
      resource :p_likes, only: [:create, :destroy]
  end
  resources :p_reviews, only: [:index, :create, :new]
end

post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

resources :notifications, only: [:index, :destroy]

devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#new_guest'
end

end