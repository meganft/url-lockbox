class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    flash[:success] = "Made an account"
    redirect_to links_path
  else
    flash[:danger] = @user.errors.full_messages.first
    render :new
  end
end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
