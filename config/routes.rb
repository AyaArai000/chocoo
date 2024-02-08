Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'sweets/top' => 'sweets#top'
  get 'sweets/:sweet_id/likes' => 'likes#create'
  get 'sweets/:sweet_id/likes/:id' => 'likes#destroy'

  resources :users, only: [:show]

  resources :sweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  get 'sindans/index' => 'sindans#index'

  root 'sweets#top'

end
