module ChampionshipsHelper
  def championships_team_name(year:, sapporo:)
    if sapporo
      case year
      when 2019
        '東海大学札幌キャンパス'
      when 2020
        '星槎道都大学'
      when 2021
        '東海大学札幌キャンパス'
      end
    else
      case year
      when 2019
        '東京農業大学北海道オホーツク'
      when 2020
        '苫小牧駒澤大学'
      when 2021
        '東京農業大学北海道オホーツク'
      end
    end
  end
end
