class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new    
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to("/users/#{@user.id}")
    else
      flash[:warning] = "Check email and password"
      redirect_to new_user_path
    end 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.image = params[:user][:image]
    @user.about = params[:user][:about] 
    @user.save   
    redirect_to("/users/#{@user.id}")
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to("/")
  end

  private
  def user_params
    return params.require(:user).permit(:name, :email, :password, :image, :about)
  end
end
