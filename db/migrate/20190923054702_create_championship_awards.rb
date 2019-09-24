class CreateChampionshipAwards < ActiveRecord::Migration[5.2]
  def change
    create_table :championship_awards do |t|
      t.references :championship, foreign_key: true, null: false
      t.string :award, null: false
      t.string :player, null: false
      t.string :team
      t.string :grade
      t.string :remarks
      t.integer :disp_id

      t.timestamps
    end
  end
end
