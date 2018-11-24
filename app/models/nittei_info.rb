class NitteiInfo < ApplicationRecord

  def self.get_team_list(year, season, event)
    nittei_infos = NitteiInfo.where(season: season, event: event).where('disp_date LIKE ?', "#{year}%")
    team_list = []
    nittei_infos.each do |nittei_info|
      unless team_list.include?(nittei_info.top_team_1)
        team_list << nittei_info.top_team_1
      end

      unless team_list.include?(nittei_info.bottom_team_1)
        team_list << nittei_info.bottom_team_1
      end
    end

    return team_list
  end


end
