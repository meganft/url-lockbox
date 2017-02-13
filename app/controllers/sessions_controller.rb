class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:success] = "Successfully logged in as #{@user.name}!"
      session[:uid] = @user.id
      redirect_to links_path
    else
      flash.now[:error] = "Login failed, please try again."
      render :new
    end
  end

  def destroy
    session.delete(:uid)
    flash[:success] = "You have successfully logged out."
    redirect_to root_path
  end
end
