class Team < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :goal, presence: true

    has_many :users
    has_many :lists, dependent: :destroy
    has_many :tasks, through: :lists
end
