class ProjectLikesController < ApplicationController
  def create
    @project_like = ProjectLike.new project_like_params
    @project_like.user = current_user
    notifier = Notifier.new(current_user)
    unless notifier.create!(@project_like)
      render_validation @project_like.errors
    end
  end
  
  private

  def project_like_params
    params.require(:project_like).permit(:project_id)
  end
end
