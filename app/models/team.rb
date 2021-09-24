class Team < ApplicationRecord
    validates :name, presence: true
    validates :goal, presence: true
end
