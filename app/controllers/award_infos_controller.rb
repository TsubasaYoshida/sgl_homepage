class AwardInfosController < ApplicationController
  before_action :set_award_info, only: [:show, :edit, :award_players_management, :update, :destroy]
  layout 'admin_sp_block'

  def index
    @award_infos = AwardInfo.all
  end

  def show
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
      redirect_to award_infos_url, notice: '表彰情報の作成に成功しました。'
    else
      render :new
    end
  end

  def update
    if @award_info.update(award_info_params)
      redirect_to award_infos_url, notice: '表彰情報の更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @award_info.destroy
    redirect_to award_infos_url, notice: '表彰情報の削除に成功しました。'
  end

  private

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
