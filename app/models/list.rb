class List < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks
    belongs_to :team
end
