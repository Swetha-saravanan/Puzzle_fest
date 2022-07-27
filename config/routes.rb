Rails.application.routes.draw do
  get 'home/home'
  get 'users/index'
  root 'users#other_index'
  get 'quiz/creategame'
  get 'home/load'
  match '/other_index' , :to => 'users#other_index' , :via=>:get
  match '/add' , :to => 'home#edit' , :via=>:get
  match '/save', :to => 'users#create', :via => :post
  # match '/render' , :to => 'home#load' , :via => :get
  match '/create-session' ,:to=> 'session#signin_handle' , :via => :post
  match '/question' ,:to=> 'quiz#create' , :via => :post
 get 'users/login'
 get 'home/about'
 get 'home/contact'
 get 'home/review'
 get 'users/other_index'
 match '/update' ,:to=> 'quiz#edit' , :via => :get
#  get 'quizzes/form'
#  get 'quizzes/edit'
#  get 'quizzes/index'
#  get 'quizzes/new'
#  get 'quizzes/show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
