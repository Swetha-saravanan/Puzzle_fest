Rails.application.routes.draw do
  get 'home/home'
  get 'users/index'
  root 'users#index'
  match '/save', :to => 'users#create', :via => :post
  get 'users/login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
