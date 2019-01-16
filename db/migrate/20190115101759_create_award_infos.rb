class CreateAwardInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :award_infos do |t|
      t.string :year
      t.string :season
      t.string :event

      t.timestamps
    end
  end
end
