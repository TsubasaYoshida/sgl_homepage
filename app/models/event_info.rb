class EventInfo < ApplicationRecord
  has_many :event_one_days, dependent: :destroy
  accepts_nested_attributes_for :event_one_days, allow_destroy: true

  # 動作確認してない
  # 順位表表示のときのチーム名取得に使う予定
  def self.get_team_list(year, season, league)
    event_info = EventInfo.find_by(year: year, season: season, league: league)
    team_list = []
    event_info.event_one_days.each do |event_one_day|
      unless team_list.include?(event_one_day.top_team_1)
        team_list << event_one_day.top_team_1
      end

      unless team_list.include?(event_one_day.bottom_team_1)
        team_list << event_one_day.bottom_team_1
      end
    end

    return team_list
  end

end
