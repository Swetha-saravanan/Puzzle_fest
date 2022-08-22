# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    render 'index'
  end

  def login
    render 'login'
  end

  def other_index
    p 'Hello'
  end

  def forgot_pwd
    render 'forgot_pwd'
  end

  def create
    if user_params[:password] == params[:Confirm_Password]
    user = User.new(user_params)
    redirect_to '/login' if user.save
    # user = User.create!(
    #   name: params[:name],
    #   email: params[:email],
    #   phone_no: params[:phone_no],
    #   password: params[:password]
    # )
    #   redirect_to '/users/login'
      p "===================================="
      p params[:Confirm_Password]
      p user_params[:password]
    else
      render :plain => "error"
      p "===================================="
      p params[:Confirm_Password]
      p user_params[:password]
  end
end

  private

  def user_params
    params.require(:users).permit(:name, :email, :phone_no, :password)
  end
end
