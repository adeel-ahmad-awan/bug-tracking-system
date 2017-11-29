class UserprojectsController < ApplicationController

  def new
    project = Project.find(params[:project_id])
    @userproject = project.userprojects.build
  end

  def create
    project = Project.find(params[:project_id])
    @userproject = project.userprojects.build(userprojects_params)
    @userproject.project_id = project.id
    if @userproject.save
      redirect_to project_path(@project)
    else
      redirect_to project_path(@project), :flash => { :error => "Image cannot be added. Try again..." }
    end
  end

  def index
  end

  def destroy
  end

  private

  def userprojects_params
    params.require(:userproject).permit(:user_id, :project_id)
  end

  def initilize_variable
    @userproject = Userproject.new
  end

end
