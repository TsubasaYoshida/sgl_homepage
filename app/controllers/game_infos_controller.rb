class GameInfosController < ApplicationController
  skip_before_action :check_logined, only: [:index, :show, :narrow, :set_game_info, :page]
  before_action :set_game_info, only: [:show, :edit, :score, :update, :destroy]
  layout 'admin', :except => [:index, :show, :narrow, :page]

  PAGE_SIZE = 15

  def index
    @game_infos = GameInfo.all.standard.limit(PAGE_SIZE)
    @games_count = (GameInfo.all.standard.size.to_f / PAGE_SIZE).ceil
    @current_page = 1
  end

  def page
    game_infos = GameInfo.all.standard
    page_common(game_infos)
    render :index
  end

  def narrow
    key_year = params[:key_year]
    key_season = params[:key_season]
    key_event = params[:key_event]
    if key_year.nil? || key_season.nil? || key_event.nil?
      @error_msg = '該当の情報はございません。'
    else
      game_infos = GameInfo
                       .where(season: key_season, event: key_event)
                       .where('disp_date LIKE ?', "#{key_year}%")
                       .order(disp_date: :desc, created_at: :desc)
      if game_infos.length == 0
        @error_msg = '該当の情報はございません。'
      end
      page_common(game_infos)
      @selected_year = key_year
      @selected_season = key_season
      @selected_event = key_event
    end
    render :index
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
      redirect_to action: :management, notice: '試合情報の作成に成功しました。'
    else
      render :new
    end
  end

  def update
    if @game_info.update(game_info_params)
      redirect_to action: :management, notice: '試合情報の更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @game_info.destroy
    redirect_to action: :management, notice: '試合情報の削除に成功しました。'
  end

  private

  def page_common(game_infos)
    page_num = params[:id] == nil ? 0 : params[:id].to_i - 1
    @game_infos = game_infos.limit(PAGE_SIZE).offset(PAGE_SIZE * page_num)
    @games_count = (game_infos.size.to_f / PAGE_SIZE).ceil
    @current_page = params[:id] == nil ? 1 : params[:id].to_i
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
