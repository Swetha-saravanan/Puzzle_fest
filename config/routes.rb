# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#login'
  get 'home/home_design'
  get 'play/display'
  get 'reports/display_reports'
  get 'assessments/display'
  get 'users/index'
  get 'quiz/creategame'
  get 'home/load'
  match '/other_index', to: 'users#other_index', via: :get
  match '/add', to: 'home#edit', via: :get
  match '/save', to: 'users#create', via: :post
  # match '/render' , :to => 'home#load' , :via => :get
  match '/create-session', to: 'session#signin_handle', via: :post
  match '/logout', to: 'session#logout', via: :get
  match '/display_questions/:id', to: 'assessments#quiz', via: :get
  match '/question', to: 'quiz#create', via: :post
  # get 'users/login'
  get 'users/forgot_pwd'
  get 'home/about'
  get 'home/contact'
  get 'home/review'
  match '/update', to: 'quiz#edit', via: :get
  match '/game', to: 'quiz#game', via: :get
  match '/assessment', to: 'assessments#store', via: :post
  get '/quiz/display/:id', to: 'quiz#display'
  get '/quiz/display1/:id', to: 'quiz#display1'
  match '/show', to: 'quiz#show', via: :post
  get 'quiz/form'
  get 'home/profile'
  get 'quiz/index'
  get 'quiz/game1'
  get 'reports/display_questions'
  match '/reports_save', to: 'assessments#reports_save', via: :post
  get 'assessments/game_pin'
  match '/check_equal', to: 'play#check', via: :post
  get 'quiz/quiztemplate'
  get 'assessments/quiz'
  get 'assessments/quiz_design'
  get 'assessments/tf_design'
  get 'assessments/fillup_design'
  get 'assessments/test'
  match '/edit_page/:id' , to: "assessments#edit_page" , via: :get
  match 'edit/:id' , to: "assessments#edit" , via: :post
  match 'delete/:id' , to:"assessments#delete" , via: :get
  get 'assessments/game'
  get 'assessments/quiz_design1'
  get 'assessments/explore'
  get 'assessments/library'
  match 'display_pin/:id' , to: 'play#display_gamepin' , via: :get
  get 'assessments/display_gamepin'
  match 'play/:id' , to: 'play#host' , via: :get
  get 'assessments/dashboard'
  match 'reports/:id' , to: 'reports#display_reports' , via: :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
