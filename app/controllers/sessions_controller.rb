class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "You have successfully logged in!"
    else
      render plain: "Incorrect Password!"
    end
  end
end
