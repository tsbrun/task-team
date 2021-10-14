class Team < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :goal, presence: true

    has_many :users
    has_many :lists, dependent: :destroy
    has_many :tasks, through: :lists

    scope :team_members, -> { extract_associated(:users) }

    # unassociate team_members so user accounts don't have to be deleted
    def remove_team_members
        self.users.each do |user|
            user.team_id = nil 
            user.save
          end
    end
end
