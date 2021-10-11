class TasksController < ApplicationController
  def new 
    @team = Team.find(params[:team_id])
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    if task.save 
      redirect_to team_path(params[:team_id])
    else
      render :new
    end
  end

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

  def destroy
    task = Task.find(params[:id])
    list = List.find(task.list_id)
    if task.destroy 
      flash[:success] = "Successfully deleted task."
      redirect_to team_path(list.team_id)
    else
      flash[:unsuccessful] = "Failed to delete task."
    end
  end

  private 

  def task_params
    params.require(:task).permit(:desc, :user_id, :list_id)
  end
end
