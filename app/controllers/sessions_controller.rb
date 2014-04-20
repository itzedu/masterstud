class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.email}!"
      redirect_to user
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path, notice: "You are now signed out!"
  end

end