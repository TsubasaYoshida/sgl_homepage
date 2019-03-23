class AwardPlayersController < ApplicationController
  before_action :set_award_player, only: [:edit, :update, :destroy]
  layout 'admin_sp_block'

  def new_award_player
    @award_player = AwardPlayer.new
    @award_info_id = params[:id]
  end

  def edit
  end

  def create
    @award_player = AwardPlayer.new(award_player_params)

    if @award_player.save
      redirect_to award_players_management_award_info_path(@award_player.award_info_id), notice: '表彰選手情報の追加に成功しました。'
    else
      render :new_award_player
    end
  end

  def update
    if @award_player.update(award_player_params)
      redirect_to award_players_management_award_info_path(@award_player.award_info_id), notice: '表彰選手情報の更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @award_player.destroy
    redirect_to award_players_management_award_info_path(@award_player.award_info_id), notice: '表彰選手情報の削除に成功しました。'
  end

  private

  def set_award_player
    @award_player = AwardPlayer.find(params[:id])
  end

  def award_player_params
    params.require(:award_player).permit(:award_info_id, :award, :player, :team, :grade, :remarks, :disp_id)
  end
end
