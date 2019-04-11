class GameInfo < ApplicationRecord

  scope :standard, -> {order(gameset_flag: :asc, disp_date: :desc, number: :desc)}

  validates :season, :event, :round, :disp_date, :batting_first_team, :field_first_team, :stadium, :number,
            presence: true

  def get_sum_top
    sum_top = 0
    15.times {|n|
      str_top = "top" << (n + 1).to_s
      sum_top += self[str_top].to_i
    }
    return sum_top
  end

  def get_sum_bottom
    sum_bottom = 0
    15.times {|n|
      str_bottom = "bottom" << (n + 1).to_s
      sum_bottom += self[str_bottom].to_i
    }
    return sum_bottom
  end

  def get_x_index(sum_top, sum_bottom)
    x = ""
    if (self[:bottom9].to_i > 0 || self[:bottom10].to_i > 0 || self[:bottom11].to_i > 0 || self[:bottom12].to_i > 0) && self[:gameset_flag] && sum_bottom > sum_top
      x = "x"
    elsif ((self[:bottom5].to_i > 0 && !self[:top6]) || (self[:bottom6].to_i > 0 && !self[:top7]) || (self[:bottom7].to_i > 0 && !self[:top8]) || (self[:bottom8].to_i > 0 && !self[:top9])) && self[:gameset_flag] && sum_bottom > sum_top
      x = "x"
    end
    return x
  end

  def get_gameset_msg
    gameset_msg = "試合中"
    if self[:gameset_flag]
      gameset_msg = "試合終了"
    end
    return gameset_msg
  end

  def get_gameset_msg_show(sum_top, sum_bottom)
    gameset_msg = ""
    if self[:gameset_flag]
      if !self[:top6]
        gameset_msg = "（5回コールド）"
      elsif !self[:top7]
        gameset_msg = "（6回コールド）"
      elsif !self[:top8]
        gameset_msg = "（7回コールド）"
      elsif !self[:top9]
        gameset_msg = "（8回コールド）"
      elsif sum_top == sum_bottom
        gameset_msg = "（引き分け）"
      end
    end
    return gameset_msg
  end

  def get_disp_event
    if self[:event] == '入替戦'
      disp_event = self[:disp_date].year.to_s + '年度' + self[:season] + 'リーグ戦入替戦'
    else
      disp_event = self[:disp_date].year.to_s + '年度' + self[:season] + self[:event]
    end
    return disp_event
  end

  def get_game_number
    return '第' + self[:number].to_s + '試合'
  end

  def get_team_initial(team)
    team_initial = ''
    if team == '東海大学札幌キャンパス'
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

  def self.win_or_lose(game_info, team_name)
    sum_top = game_info.get_sum_top
    sum_bottom = game_info.get_sum_bottom
    return :draw if sum_top == sum_bottom
    if game_info.batting_first_team == team_name
      return :win if sum_top > sum_bottom
      return :lose if sum_bottom > sum_top
    elsif game_info.field_first_team == team_name
      return :win if sum_bottom > sum_top
      return :lose if sum_top > sum_bottom
    end
  end

  def get_inputed_inning
    unless self[:top1]
      return "得点未入力"
    end

    unless self[:bottom1]
      return "1回オモテ入力済"
    end

    15.times {|n|
      str_top = "top" << (n + 1).to_s
      unless self[str_top.to_sym]
        return "#{n}回ウラ入力済"
      end

      str_bottom = "bottom" << (n + 1).to_s
      unless self[str_bottom.to_sym]
        return "#{n + 1}回オモテ入力済"
      end
    }

    return "15回ウラ入力済"
  end

end
