Rails.application.routes.draw do
  #get 'home/index'
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :charities
  resources :projects
  resources :story_categories
  resources :stories
  get '/home/user_permissions'
  get '/home/set_permissions'
end
