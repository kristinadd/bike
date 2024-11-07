class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :authorize_user!, only: [:destroy]
  
  def index
    @users = User.all.order("name ASC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to all_users_path
    else
      flash[:error] = "Coud not save the User"
      render action: "new", status: :unprocessable_entity
    end
  end

  def destroy
    find_user
    @user.destroy
    redirect_to all_users_url
  end

  def find_user
    @user = User.find(params[:id])
  end

  def authorize_user!
    unless @user == current_user
      flash[:alert] = "You are not authorized to edit or delete this user."
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
