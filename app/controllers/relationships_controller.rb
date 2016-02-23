class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new relationship_params
    relationship.follower = current_user
    @relationship = Notifier.new(current_user).create! relationship
  end
  
  private

  def relationship_params
    params.require(:relationship).permit(:user_id)
  end
end
