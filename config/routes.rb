Rails.application.routes.draw do
  devise_for :users , :controllers => {:registrations => "user/registrations"}
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'stock_search', to: "stocks#search"
  get 'my_friends', to: "users#my_friends"
  get 'search_friends', to: "users#search"
  post 'add_friend', to: "users#add_friend"




  resources :users , only: [:show]
  resources 'user_stocks', only: [:create, :destroy]
  resources :friendships

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
