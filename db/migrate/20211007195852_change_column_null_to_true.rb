class ChangeColumnNullToTrue < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :team_id, :true
  end
end
