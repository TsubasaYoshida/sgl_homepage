class CreateChampionshipGames < ActiveRecord::Migration[5.2]
  def change
    create_table :championship_games do |t|
      t.references :championship, foreign_key: true, null: false
      t.string :round
      t.date :date, null: false
      t.time :time
      t.string :stadium
      t.string :top_team
      t.string :bottom_team
      t.time :start_time
      t.time :end_time
      t.string :message
      t.boolean :rain_date
      t.boolean :no_game
      t.string :pitcher_top
      t.string :pitcher_bottom
      t.string :catcher_top
      t.string :catcher_bottom
      t.string :homerun_top
      t.string :homerun_bottom
      t.string :threebase_top
      t.string :threebase_bottom
      t.string :twobase_top
      t.string :twobase_bottom
      t.boolean :gameset_flag
      t.integer :top1
      t.integer :bottom1
      t.integer :top2
      t.integer :bottom2
      t.integer :top3
      t.integer :bottom3
      t.integer :top4
      t.integer :bottom4
      t.integer :top5
      t.integer :bottom5
      t.integer :top6
      t.integer :bottom6
      t.integer :top7
      t.integer :bottom7
      t.integer :top8
      t.integer :bottom8
      t.integer :top9
      t.integer :bottom9
      t.integer :top10
      t.integer :bottom10
      t.integer :top11
      t.integer :bottom11
      t.integer :top12
      t.integer :bottom12
      t.integer :top13
      t.integer :bottom13
      t.integer :top14
      t.integer :bottom14
      t.integer :top15
      t.integer :bottom15

      t.timestamps
    end
  end
end
