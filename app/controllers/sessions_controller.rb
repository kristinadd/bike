class SessionsController < ApplicationController
  def new
    @user = User.new
    # a hack
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path,  notice: "Logged out successfully!"
  end
end
