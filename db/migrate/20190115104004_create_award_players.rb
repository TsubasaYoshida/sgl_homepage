class CreateAwardPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :award_players do |t|
      t.references :award_info, foreign_key: true
      t.string :award
      t.string :player
      t.string :team
      t.string :grade
      t.string :remarks

      t.timestamps
    end
  end
end
