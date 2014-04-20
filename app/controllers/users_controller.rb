class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "User successfully created"
    else
      render :new
    end
  end

  def edit
    @user = find_user
  end

  def update 
    @user = find_user
    @user.update(user_params)
    redirect_to @user, notice: "User successfully updated"
  end

  def destroy
    @user = find_user
    @user.destroy
    session[:user_id] = nil
    redirect_to users_url, notice: "User successfully deleted"
  end

private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

