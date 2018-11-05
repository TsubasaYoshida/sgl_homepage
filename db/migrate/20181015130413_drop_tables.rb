class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :teams
    drop_table :leagues
  end
end
