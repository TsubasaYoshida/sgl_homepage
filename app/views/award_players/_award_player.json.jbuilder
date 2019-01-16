json.extract! award_player, :id, :award_info_id, :award, :player, :team, :grade, :remarks, :created_at, :updated_at
json.url award_player_url(award_player, format: :json)
