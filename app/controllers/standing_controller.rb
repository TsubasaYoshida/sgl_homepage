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

        if @selected_year.to_i == 2018 && @selected_season == '秋季'
          render "standing/2018_autumn"

        elsif @selected_year.to_i == 2018 && @selected_season == '春季'
          render "standing/2018_spring"

        else
          @result_infos = []
          tmp_event_list = ['1部リーグ戦', '2部リーグ戦', '3部リーグ戦']
          tmp_event_list.each do |event|

            standings = Standing.where(year: @selected_year.to_i, event: event, season: @selected_season).order(rank: :asc)

            # チーム情報を取得
            teams = []
            standings.each do |standing|
              teams << Team.find_by(name: standing.team)
            end

            rank_infos = []
            teams.each_with_index do |team, i|

              win_lose_draw = WinLoseDraw.new
              win_lose_draw.team_name = team.name
              win_lose_draw.three_letter_name = team.three_letter_name
              win_lose_draw.two_letter_name = team.two_letter_name
              win_lose_draw.one_letter_name = team.one_letter_name
              win_lose_draw.rank = standings[i].rank
              win_lose_draw.disp_win = standings[i].win
              win_lose_draw.disp_lose = standings[i].lose
              win_lose_draw.disp_draw = standings[i].draw

              rank_infos.push(win_lose_draw)
            end

            # ◯×△（ハイフンも）の生成
            result_array = []
            standings.each do |standing|
              result_array << standing.array.gsub(/-|0|1|2/, "-" => "ー", "0" => "◯", "1" => "×", "2" => "△").split(',')
            end
            result_array.flatten!

            # 最終更新日時取得
            first_record = standings.order(updated_at: :desc).first
            updated_at = first_record.updated_at if first_record

            # view の都合上、空の配列を生成
            playoff_results = []

            result_info = [rank_infos, result_array, updated_at, playoff_results]
            @result_infos << result_info
          end

          render :show

        end

      else
        describe
      end
    end
  end

  private

  def first
    @selected_year = GameInfo.order(disp_date: :desc).first.disp_date.year
    @selected_season = GameInfo.order(disp_date: :desc).first.season

    if @selected_year.to_i <= 2018
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

      # 当時のチーム名一覧を取得（入替で所属リーグが変動するためteamsテーブルからは取得できない）
      team_name_list = EventInfo.get_team_name_list(@selected_year, @selected_season, event)

      # チーム情報、チーム成績を設定
      record_list = []
      team_name_list.each do |team_name|
        team = Team.find_by(name: team_name)
        record = WinLoseDraw.new
        record.team_name = team.name
        record.three_letter_name = team.three_letter_name
        record.two_letter_name = team.two_letter_name
        record.one_letter_name = team.one_letter_name

        game_infos.each do |game_info|
          if team_name == game_info.batting_first_team || team_name == game_info.field_first_team

            if game_info.round != '順位決定戦'
              result = game_info.win_or_lose(team_name)
              record.disp_win += 1 if result == :win
              record.disp_lose += 1 if result == :lose
              record.disp_draw += 1 if result == :draw
            else
              # 順位決定戦だけで勝敗判定メソッド呼び出し
              result_playoff = game_info.win_or_lose(team_name)
              record.playoff_win += 1 if result_playoff == :win
              record.playoff_lose += 1 if result_playoff == :lose
              record.playoff_draw += 1 if result_playoff == :draw
            end
          end
        end

        # 順位決定用のポイント計算
        record.point = record.disp_win - record.disp_lose
        record.playoff_point = record.playoff_win - record.playoff_lose

        record_list << record
      end

      # 順位決定ロジック
      record_list.sort_by! do |a|
        [-a.point, -a.playoff_point]
      end
      base_point = record_list.first.point
      base_playoff_point = record_list.first.playoff_point
      base_rank = 1
      record_list.each do |record|
        if base_point == record.point && base_playoff_point == record.playoff_point
          record.rank = base_rank
        else
          record.rank = record_list.find_index(record) + 1
          base_rank = record.rank
          base_point = record.point
          base_playoff_point = record.playoff_point
        end
      end

      # ◯×△（ハイフンと空文字も）の生成
      result_array = []
      record_list.each do |record_1|
        record_list.each do |record_2|
          if record_1.team_name == record_2.team_name
            result_array << 'ー'
            result_array << 'ー'
          else
            game_info_round1 = game_infos.find_by(batting_first_team: record_1.team_name, field_first_team: record_2.team_name, round: '第一節')
            game_info_round1 ||= game_infos.find_by(batting_first_team: record_2.team_name, field_first_team: record_1.team_name, round: '第一節')
            result_array << (game_info_round1.blank? ? '' : game_info_round1.get_disp_result(record_1.team_name))
            game_info_round2 = game_infos.find_by(batting_first_team: record_1.team_name, field_first_team: record_2.team_name, round: '第二節')
            game_info_round2 ||= game_infos.find_by(batting_first_team: record_2.team_name, field_first_team: record_1.team_name, round: '第二節')
            result_array << (game_info_round2.blank? ? '' : game_info_round2.get_disp_result(record_1.team_name))
          end
        end
      end

      # 最終更新日時取得
      first_game_info = game_infos.order(updated_at: :desc).first
      updated_at = first_game_info.updated_at if first_game_info

      # 順位決定戦情報取得
      playoff_results = game_infos.where(round: '順位決定戦')

      result_info = [record_list, result_array, updated_at, playoff_results]
      @result_infos << result_info
    end

    render :show
  end

end
