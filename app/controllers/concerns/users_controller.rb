class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:error] = "Username already taken."
      redirect_to "/users/new"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end

