class CreateChampionships < ActiveRecord::Migration[5.2]
  def change
    create_table :championships do |t|
      t.string :year, null: false
      t.date :oc_date
      t.time :oc_time

      t.timestamps
    end
  end
end
