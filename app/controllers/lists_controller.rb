class ListsController < ApplicationController
    def new 
        @list = List.new
    end

    def create
        team = Team.find(params[:team_id])
        @list = team.lists.build(title: params[:list][:title])
        if @list.save 
            redirect_to team_path(team)
        else
            render :new
        end
    end

    def destroy 
        list = List.find(params[:id])
        @team = Team.find(params[:team_id])
        if list.destroy 
            redirect_to team_path(@team)
        else
            flash[:unsuccessful] = "Failed to delete list."
        end
    end

end