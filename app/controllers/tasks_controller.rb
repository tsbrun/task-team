class TasksController < ApplicationController
  def edit
    @task = Task.find(params[:id])
    @team_members = @task.list.team.users
  end

  
end
