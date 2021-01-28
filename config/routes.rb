Rails.application.routes.draw do
  devise_for :users
  root to: "definitions#index"
  resources :definitions do
    resources :answers do
      resource :likes, only: [:create, :destroy]
    end
    resources :reviews, only: [:index, :create, :new]
    resources :comments, only: :create
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

end