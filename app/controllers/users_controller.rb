class UsersController < ApplicationController
  def index
  end
  def create
    user = User.create!(
      name: params[:name],
      email: params[:email],
      phone_no: params[:phone_no],
      password: params[:password]
    )
    if user
      redirect_to "/"
    else
      render plain:"fail"
    end
  end
end
