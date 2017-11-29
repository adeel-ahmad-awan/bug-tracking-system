class StepsController < ApplicationController

  def create
    @bug = Bug.find(params[:bug_id])
    @step = @bug.steps.build(step_params)
    if @step.save
       redirect_to  bug_path(@bug)
    else
      redirect_to  bug_path(@bug), :flash => { :error => "Step cannot be save. Try again..." }
    end
  end

  def update
    @step = Step.find(params[:id])
    if @step.update(step_params)
       redirect_to  bug_path(@step.bug)
    else
      redirect_to  bug_path(@bug), :flash => { :error => "Step cannot be updated. Try again..." }
    end
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    redirect_to bug_path(@step.bug)
  end

  private

  def step_params
    params.require(:step).permit(:body)
  end

end
