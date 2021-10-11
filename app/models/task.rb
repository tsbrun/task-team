class Task < ApplicationRecord
    validates :desc, presence: true
    
    belongs_to :user, optional: true 
    belongs_to :list
end
