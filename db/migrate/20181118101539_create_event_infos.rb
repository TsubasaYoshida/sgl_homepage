class CreateEventInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :event_infos do |t|
      t.string :year
      t.string :season
      t.string :league

      t.timestamps
    end
  end
end
