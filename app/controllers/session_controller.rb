class SessionController < ApplicationController
  def signin_handle
      user = User.find_by(email: user_params["email"])
      if user && user.authenticate(user_params["password"])
        session[:id] = user
        redirect_to '/home/home'
     else
        flash[:error] = "Invalid emailId or Password"
        redirect_to '/'
     end

  end
  private
  def user_params
    params.require(:users).permit(:email,:password)
  end
end
