module AwardInfosHelper
  def season_name(season)
    case season
    when 0
      '春季'
    when 1
      '秋季'
    when 2
      '年間'
    end
  end
end
