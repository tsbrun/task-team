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
      #@team.create_list(name: `#{@team.name} List`)
      redirect_to team_path(@team)
    else 
      render :new
    end
  end

  def show 
    @team = Team.find(params[:id])
  end

  # private 

  # def new_team_params 
  #   params.require(:team).permit(:name, :goal)
  # end
end
