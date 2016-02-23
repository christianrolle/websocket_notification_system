class RelationshipsController < ApplicationController
  def create
    @relationship = Relationship.new relationship_params
    @relationship.follower = current_user
    notifier = Notifier.new(current_user)
    unless notifier.create!(@relationship)
      render_validation @relationship.errors
    end
  end
  
  private

  def relationship_params
    params.require(:relationship).permit(:user_id)
  end
end
