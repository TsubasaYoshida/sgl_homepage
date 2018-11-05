class CreateNitteiInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :nittei_infos do |t|
      t.string :event
      t.string :season
      t.date :disp_date
      t.string :stadium
      t.string :top_team_1
      t.string :bottom_team_1
      t.time :start_time_1
      t.string :message_1
      t.boolean :rain_date_flag

      t.timestamps
    end
  end
end
