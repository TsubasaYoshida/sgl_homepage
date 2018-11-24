class CreateEventOneDays < ActiveRecord::Migration[5.2]
  def change
    create_table :event_one_days do |t|
      t.references :event_info, foreign_key: true
      t.date :disp_date
      t.string :stadium
      t.string :round_1
      t.string :top_team_1
      t.string :bottom_team_1
      t.time :start_time_1
      t.string :message_1
      t.string :round_2
      t.string :top_team_2
      t.string :bottom_team_2
      t.time :start_time_2
      t.string :message_2
      t.string :round_3
      t.string :top_team_3
      t.string :bottom_team_3
      t.time :start_time_3
      t.string :message_3
      t.boolean :rain_date_flag

      t.timestamps
    end
  end
end
