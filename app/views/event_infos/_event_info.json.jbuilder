json.extract! event_info, :id, :year, :season, :league, :created_at, :updated_at
json.url event_info_url(event_info, format: :json)
