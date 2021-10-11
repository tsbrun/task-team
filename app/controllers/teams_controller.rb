class TeamsController < ApplicationController
  def new
    # new Team model for new_team form
    @team = Team.new      
  end

  def create
    # new instance of Team with params from new_team form
    @team = Team.new(name: params[:team][:name], goal: params[:team][:goal])

    # if passes validations, redirect to teams
    # else re-render form
    if @team.save
      if @team.lists.create(title: "#{@team.name} List")
        redirect_to team_path(@team)
      else
        render :new
      end
    else 
      render :new
    end
  end

  def show 
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update 
    @team = Team.find(params[:id])
    if @team.update(new_team_params)
      flash[:success] = "Successfully updated team."
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  def destroy
    team = Team.find(params[:id])

    # unassociate team_members so user accounts don't have to be deleted
    team.users.each do |user|
      user.team_id = nil 
      user.save
    end

    if team.destroy 
      flash[:success] = "Successfully deleted team."
      redirect_to root_path
    else
      flash[:unsuccessful] = "Failed to delete team."
    end
  end

  private 

  def new_team_params 
    params.require(:team).permit(:name, :goal)
  end
end
