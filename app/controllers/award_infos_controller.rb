class AwardInfosController < ApplicationController
  skip_before_action :check_logined, only: [:index, :find, :first]
  before_action :set_award_info, only: [:edit, :award_players_management, :update, :destroy]
  layout 'admin_sp_block', except: [:index, :find, :first]

  def index
    first
  end

  def find
    key_year = params[:key_year]
    key_season = params[:key_season]
    key_event = params[:key_event]
    if key_year.nil? || key_season.nil? || key_event.nil?
      first
    else
      award_info = AwardInfo.find_by(year: key_year, season: key_season, event: key_event)
      if award_info
        @award_players = award_info.award_players.where.not('award LIKE ?', "ベストナイン%").order(disp_id: :asc)
        @bestnine_players = award_info.award_players.where('award LIKE ?', "ベストナイン%").order(disp_id: :asc)
      else
        @error_msg = '該当の情報はございません。'
      end

      @selected_year = key_year
      @selected_season = key_season
      @selected_event = key_event
      render :index
    end
  end

  def management
    @award_infos = AwardInfo.all.order(year: :desc, season: :desc, event: :asc)
  end

  def new
    @award_info = AwardInfo.new
  end

  def edit
  end

  def award_players_management
    @award_players = AwardPlayer.where(award_info_id: @award_info).order(disp_id: :asc)
  end

  def create
    @award_info = AwardInfo.new(award_info_params)

    if @award_info.save
      redirect_to management_award_infos_path, notice: '表彰情報の作成に成功しました。'
    else
      render :new
    end
  end

  def update
    if @award_info.update(award_info_params)
      redirect_to management_award_infos_path, notice: '表彰情報の更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @award_info.destroy
    redirect_to management_award_infos_path, notice: '表彰情報の削除に成功しました。'
  end

  private

  def first
    award_info = AwardInfo.order(year: :desc, season: :desc, event: :asc).first
    @award_players = award_info.award_players.where.not('award LIKE ?', "ベストナイン%").order(disp_id: :asc)
    @bestnine_players = award_info.award_players.where('award LIKE ?', "ベストナイン%").order(disp_id: :asc)

    @selected_year = award_info.year
    @selected_season = award_info.season
    @selected_event = award_info.event

    render :index
  end

  def set_award_info
    @award_info = AwardInfo.find(params[:id])
  end

  def award_info_params
    params.require(:award_info).permit(
        :year, :season, :event,
        award_players_attributes: [
            :id, :award_info_id,
            :award, :player, :team, :grade, :remarks, :disp_id,
            :_destroy
        ]
    )
  end
end
