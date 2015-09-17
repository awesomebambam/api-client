class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
  end

  def search
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :role, :email)
  end
end
