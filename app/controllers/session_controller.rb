# frozen_string_literal: true

class SessionController < ApplicationController
  def signin_handle
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:id] = user.id

      p '-------------------'
      p session[:id]
      redirect_to '/home'
    else
      flash[:error] = 'Invalid emailId or Password'
      render plain: 'Failure'
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end
  # private
  # def user_params
  #   params.require(:users).permit(:email,:password)
  # end
end
