class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params[:user]
    user = User.find_by(username: user_params[:username])
    if user && user.password == user_params[:password]
      session[:user_id] = user.id
      redirect_to posts_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to posts_path
  end

end
