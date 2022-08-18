# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#home_design'
  match '/register', to: 'users#index', via: :get
  match '/login', to: 'users#login', via: :get
  match '/home', to: 'home#home_design', via: :get
  match '/about', to: 'home#about', via: :get
  match '/explore', to: 'assessments#explore', via: :get
  match '/library', to: 'assessments#library', via: :get
  match '/dashboard', to: 'assessments#dashboard', via: :get
  match '/quiz', to: 'assessments#game', via: :get
  match '/reports', to: 'reports#display_reports', via: :get
  match '/game_pin', to: 'assessments#displaygame_pin', via: :get
  match '/pin', to: 'assessments#game_pin', via: :get
  get '/display', to: 'assessments#display', via: :get
  get 'quiz/creategame'
  # get 'home/load'
  # match '/other_index', to: 'users#other_index', via: :get
  match '/add', to: 'home#edit', via: :get
  match '/save', to: 'users#create', via: :post
  # match '/render' , :to => 'home#load' , :via => :get
  match '/create-session', to: 'session#signin_handle', via: :post
  match '/logout', to: 'session#logout', via: :get
  match '/display_questions/:id', to: 'assessments#quiz', via: :get
  match '/question', to: 'quiz#create', via: :post
  match '/forgot_pwd', to: 'users#forgot_pwd', via: :get
  match '/update', to: 'quiz#edit', via: :get
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
  match '/game', to: 'assessments#quiz_design', via: :get
  match '/edit_page/:id', to: 'assessments#edit_page', via: :get
  match 'edit/:id', to: 'assessments#edit', via: :post
  match 'delete/:id', to: 'assessments#delete', via: :get
  get 'assessments/game'
  match '/edit', to: 'assessments#quiz_design1', via: :get
  get 'assessments/explore'
  match 'display_pin/:id', to: 'play#display_gamepin', via: :get
  match '/gamepin', to: 'assessments#display_gamepin', via: :get
  match 'play/:id', to: 'play#host', via: :get
  match 'change/:id/:ass_id', to: 'play#change', via: :get
  # match 'reports/:id' , to: 'reports#display_reports' , via: :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
