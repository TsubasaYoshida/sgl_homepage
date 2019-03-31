class CreateStandings < ActiveRecord::Migration[5.2]
  def change
    create_table :standings do |t|
      t.integer :year
      t.string :season
      t.string :event
      t.integer :rank
      t.string :team
      t.string :array
      t.integer :win
      t.integer :lose
      t.integer :draw

      t.timestamps
    end
  end
end
