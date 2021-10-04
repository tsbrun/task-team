class Team < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :goal, presence: true

    has_many :lists 
    has_many :users, :through => :lists 
end
