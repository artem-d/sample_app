class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation)) 
    if @user.save
      flash[:success] = "Welcome to My Awesome App!"
      redirect_to @user
    else
      render 'new'
    end    
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
