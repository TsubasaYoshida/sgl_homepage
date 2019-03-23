class StandingController < ApplicationController
  skip_before_action :check_logined

  def show
    first
  end

  def find
    key_year = params[:key_year]
    key_season = params[:key_season]
    if key_year.nil? || key_season.nil?
      first
    else
      @selected_year = key_year
      @selected_season = key_season

      if @selected_year.to_i <= 2018
        english_season = Constants.get_english_season(@selected_season)
        file_name = @selected_year.to_s + '_' + english_season
        render "standing/#{file_name}"
      else
        describe
      end
    end
  end

  private

  def first
    @selected_year = GameInfo.order(disp_date: :desc).first.disp_date.year
    @selected_season = GameInfo.order(disp_date: :desc).first.season

    if @selected_year.to_i <= 2017
      english_season = Constants.get_english_season(@selected_season)
      file_name = @selected_year.to_s + '_' + english_season
      render "standing/#{file_name}"
    else
      describe
    end
  end

  def describe
    @result_infos = []
    tmp_event_list = ['1部リーグ戦', '2部リーグ戦', '3部リーグ戦']
    tmp_event_list.each do |event|

      game_infos = GameInfo.where(event: event, season: @selected_season, gameset_flag: true).where('disp_date LIKE ?', "#{@selected_year}%")
      win_lose_draw_list = []

      # 当時のチーム名一覧を取得（入替で所属リーグが変動するためteamsテーブルからは取得できない）
      teams = []
      team_list = EventInfo.get_team_list(@selected_year, @selected_season, event)

      # チーム情報を取得
      team_list.each do |team|
        teams << Team.find_by(name: team)
      end

      teams.each do |team|
        win_lose_draw = WinLoseDraw.new
        win_lose_draw.team_name = team.name
        win_lose_draw.three_letter_name = team.three_letter_name
        win_lose_draw.two_letter_name = team.two_letter_name
        win_lose_draw.one_letter_name = team.one_letter_name
        win_lose_draw_list.push(win_lose_draw)
      end
      win_lose_draw_list.each do |win_lose_draw|
        team_name = win_lose_draw.team_name
        game_infos.each do |game_info|
          if team_name == game_info.batting_first_team || team_name == game_info.field_first_team

            if game_info.round != '順位決定戦'
              result = GameInfo.win_or_lose(game_info, team_name)

              if result == :win
                win_lose_draw.disp_win += 1
              elsif result == :lose
                win_lose_draw.disp_lose += 1
              elsif result == :draw
                win_lose_draw.disp_draw += 1
              end

            else
              # 順位決定戦だけで勝敗判定メソッド呼び出し
              result_playoff = GameInfo.win_or_lose(game_info, team_name)

              if result_playoff == :win
                win_lose_draw.playoff_win += 1
              elsif result_playoff == :lose
                win_lose_draw.playoff_lose += 1
              elsif result_playoff == :draw
                win_lose_draw.playoff_draw += 1
              end

            end

          end
        end

        # 順位決定用のポイント計算
        win_lose_draw.point = win_lose_draw.disp_win - win_lose_draw.disp_lose
        win_lose_draw.playoff_point = win_lose_draw.playoff_win - win_lose_draw.playoff_lose
      end

      # 順位決定ロジック
      rank_infos = win_lose_draw_list.sort_by do |a|
        [-a.point, -a.playoff_point]
      end
      base_point = rank_infos.first.point
      base_playoff_point = rank_infos.first.playoff_point
      base_rank = 1
      rank_infos.each do |rank_info|
        if base_point == rank_info.point && base_playoff_point == rank_info.playoff_point
          rank_info.rank = base_rank
        else
          rank_info.rank = rank_infos.find_index(rank_info) + 1
          base_rank = rank_info.rank
          base_point = rank_info.point
          base_playoff_point = rank_info.playoff_point
        end
      end

      # ◯×△（ハイフンと空文字も）の生成
      result_array = []
      rank_infos.each do |rank_info1|
        rank_infos.each do |rank_info2|
          if rank_info1.team_name == rank_info2.team_name
            result_array << 'ー'
            result_array << 'ー'
          else
            result_array << get_disp_result(game_infos, rank_info1.team_name, rank_info2.team_name, '第一節')
            result_array << get_disp_result(game_infos, rank_info1.team_name, rank_info2.team_name, '第二節')
          end
        end
      end

      # 最終更新日時取得
      first_game_info = game_infos.order(updated_at: :desc).first
      unless first_game_info.nil?
        updated_at = first_game_info.updated_at
      end

      playoff_results = game_infos.where(round: '順位決定戦')

      result_info = [rank_infos, result_array, updated_at, playoff_results]
      @result_infos << result_info
    end

    render 'standing/show'
  end

  def get_disp_result(game_infos, team_1, team_2, round)
    game_info = game_infos.find_by(batting_first_team: team_1, field_first_team: team_2, round: round)
    if game_info.nil?
      game_info = game_infos.find_by(batting_first_team: team_2, field_first_team: team_1, round: round)
    end
    if game_info
      result = GameInfo.win_or_lose(game_info, team_1)
      return '◯' if result == :win
      return '×' if result == :lose
      return '△' if result == :draw
    else
      return ''
    end
  end

end
