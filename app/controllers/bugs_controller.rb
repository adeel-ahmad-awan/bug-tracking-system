class BugsController < ApplicationController
  def new
    puts "IN NEW ... "
    # @bug = Bug.new
    @project = Project.find(params[:project_id])
    @bug = project.bugs.build
  end

  def create
    # puts "IN CREATE ... "
    # puts params.inspect

    project = Project.find(params[:project_id])
    @bug = project.bugs.build(bug_params)
    @bug.status = "open"
    @bug.user_id = current_user.id
    project.increment!(:bugs_num)

    if @bug.save
      redirect_to bug_path(@bug), notice: 'Bug was successfully created.'
    else
      render :new
    end
  end

  def index
    puts "IN INDEX ... "
    # @bugs = Bug.all
    project = Project.find(params[:project_id])
    @bugs = project.bugs
    @project = project
  end

  def show
    puts "IN SHOW ... "
    @bug = Bug.find(params[:id])
    @project = @bug.project
    @bugReproducingSteps = @bug.steps
  end

  def edit
    puts "IN EDIT ... "
    @bug = Bug.find(params[:id])
    authorize @bug
  end

  def update
    puts "IN UPDATE ... "
    puts params.inspect

    @bug = Bug.find(params[:id])
    if @bug.update(bug_params)
      redirect_to bug_path(@bug), notice: 'Bug was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    puts "IN DESTROY ... \n"
    project = Project.find(params[:project_id])
    @bug = project.bugs.find(params[:id])
    @bug.destroy
    redirect_to project_bugs_path(@bug.project.id)
  end

private

  def bug_params
    params.require(:bug).permit(:name, :reported_by, :priority, :description, :status, :project_id)
  end

end
