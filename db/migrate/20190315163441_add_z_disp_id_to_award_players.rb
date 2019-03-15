class AddZDispIdToAwardPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :award_players, :disp_id, :integer
    remove_column :award_players, :order
  end
end
