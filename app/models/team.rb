class Team < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :goal, presence: true
end
