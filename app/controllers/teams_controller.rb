class TeamsController < ApplicationController
  def new
    # new Team model for new_team form
    @team = Team.new      
  end

  #def create
    #if saves => reroute to Team show page 
    #else => reload new_team form with validation error 
  #end

  # private 

  # def new_team_params 
  #   params.require(:team).permit(:name, :goal)
  # end
end
