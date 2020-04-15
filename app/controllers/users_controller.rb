class UsersController < ApplicationController
  skip_before_action :ensure_user_signed_in

  def new
    render "users/new"
  end

  def index
    render plain: User.all.map { |user| user.to_look_pleasant }.join("\n")
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    if new_user.save
      redirect_to todos_path
      session[:current_user_id] = new_user.id
      @current_user = new_user
    else
      flash[:error] = new_user.errors.full_messages.join(" & ")
      redirect_to new_user_path
    end
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: "User with id #{id} : #{user.to_look_pleasant}"
  end

  def login
    render plain: User.where(email: params[:email], password: params[:password]).exists?
  end
end
