Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships

  root 'welcome#index'
  get '/portfolio' => 'users#portfolio'
  get '/search_stocks' => 'stocks#search'
  get '/friends' => 'users#friends'
  get '/search_friends' => 'users#search'
  post '/add_friend' => 'users#add_friend'
end
