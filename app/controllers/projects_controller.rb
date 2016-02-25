class ProjectsController < ApplicationController

  def create
    @project = Project.new project_params
    @project.user = current_user
    notifier = Notifier.new(current_user)
    unless notifier.create!(@project)
      render_validation @project.errors
    end
  end

  private

  def project_params
    params.require(:project).permit(:topic)
  end

end
