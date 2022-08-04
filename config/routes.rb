Rails.application.routes.draw do
  get 'assessments/display'
  root 'home#home'
  get 'users/index'
  get 'quiz/creategame'
  get 'home/load'
  match '/other_index' , :to => 'users#other_index' , :via=>:get
  match '/add' , :to => 'home#edit' , :via=>:get
  match '/save', :to => 'users#create', :via => :post
  # match '/render' , :to => 'home#load' , :via => :get
  match '/create-session' ,:to=> 'session#signin_handle' , :via => :post
  match '/logout' ,:to=> 'session#logout' , :via => :get
 match '/display_questions/:id',:to => 'assessments#quiz' , :via =>:get
  match '/question' ,:to=> 'quiz#create' , :via => :post
 get 'users/login'
 get 'users/forgot_pwd'
 get 'home/about'
 get 'home/contact'
 get 'home/review'
 get 'users/other_index'
 match '/update' ,:to=> 'quiz#edit' , :via => :get
 match '/game' , :to=> 'quiz#game' , :via => :get
 match '/assessment', :to=>'assessments#store' , :via => :post
 get '/quiz/display/:id' , :to=>'quiz#display'
 get '/quiz/display1/:id' , :to=>'quiz#display1'
 match '/show' , :to=> 'quiz#show' , :via => :post
get 'quiz/form'
get 'quiz/game'
get 'home/profile'
get 'assessments/display_questions'
#  get 'quizzes/form'
#  get 'quizzes/edit'
#  get 'quizzes/index'
#  get 'quizzes/new'
#  get 'quizzes/show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
