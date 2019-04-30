class GameInfosController < ApplicationController
  skip_before_action :check_logined, only: [:index, :show, :set_game_info, :paging]
  before_action :set_game_info, only: [:show, :edit, :score, :update, :destroy]
  layout 'admin', :except => [:index, :show, :paging]
  PAGE_SIZE = 15

  def index
    @current = params[:page].nil? ? 1 : params[:page].to_i

    unless @narrowed = params[:narrowed]
      @game_infos = GameInfo.all.standard.limit(PAGE_SIZE).offset(PAGE_SIZE * (@current - 1))
      @max_page = (GameInfo.all.standard.size.to_f / PAGE_SIZE).ceil
    else
      key_year = params[:key_year]
      key_season = params[:key_season]
      key_event = params[:key_event]
      if key_year.nil? || key_season.nil? || key_event.nil?
        @error_msg = '該当の情報はございません。'
      else
        narrowed_games = GameInfo
                             .where(season: key_season, event: key_event)
                             .where('disp_date LIKE ?', "#{key_year}%")
                             .order(gameset_flag: :asc, disp_date: :desc, number: :desc, start_time: :desc)
        @game_infos = narrowed_games
                          .limit(PAGE_SIZE)
                          .offset(PAGE_SIZE * (@current - 1))
        @max_page = (narrowed_games.size.to_f / PAGE_SIZE).ceil
        if @game_infos.length == 0
          @error_msg = '該当の情報はございません。'
        end
        @selected_year = key_year
        @selected_season = key_season
        @selected_event = key_event
      end
    end

    paging unless @error_msg

  end

  def show
  end

  def new
    @game_info = GameInfo.new
  end

  def edit
  end

  def score
  end

  def management
    @game_infos = GameInfo.all.standard
  end

  def create
    @game_info = GameInfo.new(game_info_params)

    if @game_info.save
      redirect_to management_game_infos_url, notice: '試合情報の作成に成功しました。'
    else
      render :new
    end
  end

  def update
    if @game_info.update(game_info_params)
      redirect_to management_game_infos_url, notice: '試合情報の更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @game_info.destroy
    redirect_to management_game_infos_url, notice: '試合情報の削除に成功しました。'
  end

  private

  def paging

    @pagination = {}
    if 3 <= @current
      @pagination['≪'] = 1
    end
    if 1 != @current
      @pagination['<'] = @current - 1
    end

    if @current + 2 >= @max_page
      @pagination.merge!({@max_page - 2 => @max_page - 2, @max_page - 1 => @max_page - 1, @max_page => @max_page})
      delete_list = [0, -1]
      @pagination.delete_if do |key, value|
        delete_list.include?(value)
      end
    else
      @pagination.merge!({@current => @current, @current + 1 => @current + 1, @current + 2 => @current + 2})
    end

    if @max_page != @current
      @pagination['>'] = @current + 1
    end
    if @max_page - 3 >= @current
      @pagination['≫'] = @max_page
    end

  end

  def set_game_info
    @game_info = GameInfo.find(params[:id])
  end

  def game_info_params
    params.require(:game_info).permit(:season, :event, :round, :disp_date,
                                      :batting_first_team, :field_first_team,
                                      :stadium, :number, :start_time, :end_time,
                                      :pitcher_top, :pitcher_bottom, :catcher_top, :catcher_bottom,
                                      :homerun_top, :homerun_bottom, :threebase_top, :threebase_bottom,
                                      :twobase_top, :twobase_bottom, :message,
                                      :top1, :bottom1, :top2, :bottom2, :top3, :bottom3, :top4, :bottom4,
                                      :top5, :bottom5, :top6, :bottom6, :top7, :bottom7, :top8, :bottom8,
                                      :top9, :bottom9, :top10, :bottom10, :top11, :bottom11, :top12, :bottom12,
                                      :top13, :bottom13, :top14, :bottom14, :top15, :bottom15,
                                      :gameset_flag)
  end
end
