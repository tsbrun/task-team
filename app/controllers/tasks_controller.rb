class TasksController < ApplicationController
  def edit
    @task = Task.find(params[:id])
    @team_members = @task.list.team.users
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to team_path(@task.list.team)
    else
      render :edit
    end
  end

  private 

  def task_params
    params.require(:task).permit(:desc, :user_id)
  end
end
