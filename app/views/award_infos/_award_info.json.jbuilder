json.extract! award_info, :id, :year, :season, :event, :created_at, :updated_at
json.url award_info_url(award_info, format: :json)
