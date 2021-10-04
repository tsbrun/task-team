class AddTeamToList < ActiveRecord::Migration[6.1]
  def change
    add_reference :lists, :team, null: false, foreign_key: true
  end
end
