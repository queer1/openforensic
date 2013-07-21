class InvestigationsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :new, :edit, :update]
  
  def new
    @investigation = Investigation.new
  end
  
  def show
     @investigation = Investigation.find(params[:id])
  end
  
  def index
    @investigations = Investigation.paginate(page: params[:page])
  end
   
  def create
    @investigation = Investigation.new(params[:investigation])
    if @investigation.save
      flash[:success] = "You've successfully created an Investigation..."
      redirect_to @investigation
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    @investigation = Investigation.find(params[:id])
    if @investigation.update_attributes(params[:investigation])
      flash[:success] = "Investigation updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Investigation destroyed"
    redirect_to users_path
  end
  
end