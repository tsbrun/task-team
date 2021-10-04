class Team < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :goal, presence: true

    has_many :lists 
    has_many :users, :through => :lists 

    # def initialize(team, name)
    #     @team, @name = team, name 
    #     default_list = List.new(name: `#{name} List`)
    #     self.lists << default_list
    # end
end
