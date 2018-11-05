class AddSeasonToGameInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :game_infos, :season, :string
  end
end
