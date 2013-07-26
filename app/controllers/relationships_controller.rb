class RelationshipsController < ApplicationController
  before_filter :signed_in_user
  
  def create
    @investigation = Investigation.find(params[:relationship][:followed_id])
    current_user.follow!(@investigation)
    redirect_to @investigation
  end
  
  def destroy
    @investigation = Relationship.find(params[:id]).followed
    current_user.unfollow!(@investigation)
    redirect_to @investigation
  end
end
