class TeamsController < ApplicationController
  def new
    @team = Team.new      
  end

  def create
    @team = Team.new(name: params[:team][:name], goal: params[:team][:goal])

    if @team.save
      @team.users << current_user
      redirect_to team_path(@team)
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

    team.remove_team_members

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
