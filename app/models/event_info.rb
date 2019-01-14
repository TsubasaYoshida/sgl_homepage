class EventInfo < ApplicationRecord
  has_many :event_one_days, dependent: :destroy
  accepts_nested_attributes_for :event_one_days, allow_destroy: true

  # 順位表表示のときのチーム名取得に使う
  def self.get_team_list(year, season, league)
    event_info = EventInfo.find_by(year: year, season: season, league: league)
    team_list = []
    event_info.event_one_days.each do |event_one_day|
      unless team_list.include?(event_one_day.top_team_1) || event_one_day.top_team_1.blank?
        team_list << event_one_day.top_team_1
      end

      unless team_list.include?(event_one_day.bottom_team_1) || event_one_day.bottom_team_1.blank?
        team_list << event_one_day.bottom_team_1
      end

      unless team_list.include?(event_one_day.top_team_2) || event_one_day.top_team_2.blank?
        team_list << event_one_day.top_team_2
      end

      unless team_list.include?(event_one_day.bottom_team_2) || event_one_day.bottom_team_2.blank?
        team_list << event_one_day.bottom_team_2
      end

      unless team_list.include?(event_one_day.top_team_3) || event_one_day.top_team_3.blank?
        team_list << event_one_day.top_team_3
      end

      unless team_list.include?(event_one_day.bottom_team_3) || event_one_day.bottom_team_3.blank?
        team_list << event_one_day.bottom_team_3
      end
    end

    return team_list
  end

end
