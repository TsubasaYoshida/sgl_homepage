class ChampionshipGame < ApplicationRecord
  belongs_to :championship

  def get_sum_top
    sum_top = 0
    15.times {|n|
      str_top = "top" << (n + 1).to_s
      sum_top += self[str_top].to_i
    }
    if self.start_time.blank? && self.top1.blank?
      nil
    else
      sum_top
    end
  end

  def get_sum_bottom
    sum_bottom = 0
    15.times {|n|
      str_bottom = "bottom" << (n + 1).to_s
      sum_bottom += self[str_bottom].to_i
    }
    if self.start_time.blank? && self.top1.blank?
      nil
    else
      sum_bottom
    end
  end

  def get_game_status
    "試合終了" if self.gameset_flag
  end

  def get_team_initial(is_top)
    team = is_top ? self.top_team : self.bottom_team
    team_initial = '　'
    if team == '東京農業大学北海道オホーツク'
      team_initial = 'オ'
    elsif team == '東海大学札幌キャンパス'
      team_initial = '東'
    elsif team == '星槎道都大学'
      team_initial = '道'
    elsif team == '北翔大学'
      team_initial = '翔'
    elsif team == '北海道大学'
      team_initial = '北'
    elsif team == '札幌大学'
      team_initial = '札'
    elsif team == '北海学園大学'
      team_initial = '学'
    elsif team == '札幌国際大学'
      team_initial = '国'
    elsif team == '小樽商科大学'
      team_initial = '樽'
    elsif team == '札幌学院大学'
      team_initial = '院'
    elsif team == '北海道教育大学岩見沢校'
      team_initial = '岩'
    elsif team == '札幌大谷大学'
      team_initial = '大'
    elsif team == '北海道教育大学札幌校'
      team_initial = '教'
    elsif team == '北海道科学大学'
      team_initial = '科'
    elsif team == '北星学園大学'
      team_initial = '星'
    elsif team == '酪農学園大学'
      team_initial = '酪'
    elsif team == '北海道文教大学'
      team_initial = '文'
    elsif team == '北海道情報大学'
      team_initial = '情'
    elsif team == '北海道医療大学'
      team_initial = '医'
    end
    return team_initial
  end

end
