class ExhibitsController < ApplicationController
  include AutoHtml
  
  def new
    @exhibit = Exhibit.new
  end
  
  def show
    @investigation = Investigation.find(params[:investigation_id])
    @exhibit = Exhibit.find(params[:id])
  end
  
  def index
    @exhibits = Exhibit.paginate(page: params[:page])
  end
   
  def create
    @investigation = Investigation.find(params[:investigation_id])
    @exhibit = @investigation.exhibits.create(params[:exhibit])
    if @exhibit.save
      flash[:success] = "You've successfully added a piece of evidence..."
      redirect_to investigation_path(@investigation)
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
