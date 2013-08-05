class PlayersController < ApplicationController
  
  def new
    @player = Player.new
  end
  
  def show
     @player = Player.find(params[:id])
  end
  
  def index
    @players = Player.paginate(page: params[:page])
  end
   
  def create
    @investigation = Investigation.find(params[:investigation_id])
    @player = @investigation.players.create(params[:player])
    if @player.save
      flash[:success] = "You've successfully created a Person of Interest..."
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
