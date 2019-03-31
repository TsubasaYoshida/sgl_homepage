# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_31_044426) do

  create_table "award_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "year"
    t.string "season"
    t.string "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "award_players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "award_info_id"
    t.string "award"
    t.string "player"
    t.string "team"
    t.string "grade"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "disp_id"
    t.index ["award_info_id"], name: "index_award_players_on_award_info_id"
  end

  create_table "awards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "year"
    t.string "season"
    t.string "league"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "oc_date"
    t.time "oc_time"
  end

  create_table "event_one_days", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "event_info_id"
    t.date "disp_date"
    t.string "stadium"
    t.string "round_1"
    t.string "top_team_1"
    t.string "bottom_team_1"
    t.time "start_time_1"
    t.string "message_1"
    t.string "round_2"
    t.string "top_team_2"
    t.string "bottom_team_2"
    t.time "start_time_2"
    t.string "message_2"
    t.string "round_3"
    t.string "top_team_3"
    t.string "bottom_team_3"
    t.time "start_time_3"
    t.string "message_3"
    t.boolean "rain_date_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_info_id"], name: "index_event_one_days_on_event_info_id"
  end

  create_table "game_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "event"
    t.string "round"
    t.date "disp_date"
    t.string "batting_first_team"
    t.string "field_first_team"
    t.string "stadium"
    t.integer "number"
    t.time "start_time"
    t.time "end_time"
    t.string "pitcher_top"
    t.string "pitcher_bottom"
    t.string "catcher_top"
    t.string "catcher_bottom"
    t.string "homerun_top"
    t.string "homerun_bottom"
    t.string "threebase_top"
    t.string "threebase_bottom"
    t.string "twobase_top"
    t.string "twobase_bottom"
    t.string "message"
    t.integer "top1"
    t.integer "bottom1"
    t.integer "top2"
    t.integer "bottom2"
    t.integer "top3"
    t.integer "bottom3"
    t.integer "top4"
    t.integer "bottom4"
    t.integer "top5"
    t.integer "bottom5"
    t.integer "top6"
    t.integer "bottom6"
    t.integer "top7"
    t.integer "bottom7"
    t.integer "top8"
    t.integer "bottom8"
    t.integer "top9"
    t.integer "bottom9"
    t.integer "top10"
    t.integer "bottom10"
    t.integer "top11"
    t.integer "bottom11"
    t.integer "top12"
    t.integer "bottom12"
    t.integer "top13"
    t.integer "bottom13"
    t.integer "top14"
    t.integer "bottom14"
    t.integer "top15"
    t.integer "bottom15"
    t.boolean "gameset_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "season"
  end

  create_table "infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "article"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "disp_date"
  end

  create_table "leagues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "year"
    t.string "season"
    t.string "event"
    t.integer "rank"
    t.string "team"
    t.string "array"
    t.integer "win"
    t.integer "lose"
    t.integer "draw"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "league_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "three_letter_name"
    t.string "two_letter_name"
    t.string "one_letter_name"
    t.string "hp_team"
    t.string "hp_college"
    t.index ["league_id"], name: "index_teams_on_league_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "award_players", "award_infos"
  add_foreign_key "event_one_days", "event_infos"
  add_foreign_key "teams", "leagues"
end
