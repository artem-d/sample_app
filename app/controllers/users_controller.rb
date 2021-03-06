class UsersController < ApplicationController
  before_action :signed_in,      only: [:new, :create]
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :admin_warning,  only: :destroy

  def index
    @users = User.paginate(page: params[:page], per_page: 15).order('name ASC')
  end

  def show
    @user = User.find_by_id(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      sign_in @user
      flash[:success] = 'Welcome to My Awesome App!'
      redirect_to @user
    else
      render 'new'
    end    
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find_by_id(params[:id])    
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
      User.find(params[:id]).destroy
      flash[:success] = 'User destroyed.'
      redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      redirect_to root_path unless current_user.admin?
    end

    def admin_warning
      if User.find(params[:id]).admin?
        flash[:error] = 'Cannot delete admin user.'
        redirect_to root_path
      end
    end

    def signed_in
      redirect_to root_path if signed_in?
    end
end