class SessionsController < ApplicationController
  skip_before_action :ensure_user_signed_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
      flash[:success] = "Successfully Signed in!"
    else
      redirect_to new_session_path
      flash[:error] = "Invalid Email or Password.Try Again! "
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user_id = nil
    redirect_to "/"
  end
end
