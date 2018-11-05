json.extract! nittei_info, :id, :event, :season, :disp_date, :stadium, :top_team_1, :bottom_team_1, :start_time_1, :message_1, :rain_date_flag, :created_at, :updated_at
json.url nittei_info_url(nittei_info, format: :json)
