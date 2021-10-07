class ListsController < ApplicationController
    def new 
        @list = List.new
    end

    # def create 
    #     byebug
    # end
end