class AddOrderToAwardPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :award_players, :order, :string
  end
end
