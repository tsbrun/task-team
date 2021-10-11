class List < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :users, through: :tasks
    belongs_to :team
end
