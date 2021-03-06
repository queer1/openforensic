class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :destroy, :following]
  before_filter :correct_user,   only: [:edit, :update]

  
  def new
    @user = User.new
  end
  
  def show
     @user = User.find(params[:id])
  end
   
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Authentication App..."
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      sign_in @user
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end
  
  def following
    @title = "My Investigations"
    @user = User.find(params[:id])
    @investigations = @user.followed_investigations.paginate(page: params[:page])
    render 'show_follow'
  end
  
  private
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
   
end
