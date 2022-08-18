# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    render 'index'
  end

  def login
    render 'login'
  end

  def other_index; end

  def forgot_pwd
    render 'forgot_pwd'
  end

  def create
    user = User.new(user_params)
    redirect_to '/users/login' if user.save
    # user = User.create!(
    #   name: params[:name],
    #   email: params[:email],
    #   phone_no: params[:phone_no],
    #   password: params[:password]
    # )
    #   redirect_to '/users/login'
  end

  private

  def user_params
    params.require(:users).permit(:name, :email, :phone_no, :password)
  end
end
