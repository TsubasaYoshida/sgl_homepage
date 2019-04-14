class AddNoGameFlgToEventOneDays < ActiveRecord::Migration[5.2]
  def change
    add_column :event_one_days, :no_game_1, :boolean
    add_column :event_one_days, :no_game_2, :boolean
    add_column :event_one_days, :no_game_3, :boolean
  end
end
