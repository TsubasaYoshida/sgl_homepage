class AddTopTeam2ToNitteiInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :nittei_infos, :top_team_2, :string
    add_column :nittei_infos, :bottom_team_2, :string
    add_column :nittei_infos, :start_time_2, :time
    add_column :nittei_infos, :message_2, :string
    add_column :nittei_infos, :top_team_3, :string
    add_column :nittei_infos, :bottom_team_3, :string
    add_column :nittei_infos, :start_time_3, :time
    add_column :nittei_infos, :message_3, :string
  end
end
