class AwardPlayersController < ApplicationController
  before_action :set_award_player, only: [:show, :edit, :update, :destroy]
  layout 'admin_sp_block'

  # GET /award_players
  # GET /award_players.json
  def index
    @award_players = AwardPlayer.all
  end

  # GET /award_players/1
  # GET /award_players/1.json
  def show
  end

  # GET /award_players/new_award_player
  def new_award_player
    @award_player = AwardPlayer.new
    @award_info_id = params[:id]
  end

  # GET /award_players/1/edit
  def edit
  end

  # POST /award_players
  # POST /award_players.json
  def create
    @award_player = AwardPlayer.new(award_player_params)

    respond_to do |format|
      if @award_player.save
        format.html {redirect_to "/award_infos/#{@award_player.award_info_id}/award_players_management", notice: '表彰選手情報の追加に成功しました。'}
        format.json {render :show, status: :created, location: @award_player}
      else
        format.html {render :new_award_player}
        format.json {render json: @award_player.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /award_players/1
  # PATCH/PUT /award_players/1.json
  def update
    respond_to do |format|
      if @award_player.update(award_player_params)
        format.html {redirect_to "/award_infos/#{@award_player.award_info_id}/award_players_management", notice: '表彰選手情報の更新に成功しました。'}
        format.json {render :show, status: :ok, location: @award_player}
      else
        format.html {render :edit}
        format.json {render json: @award_player.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /award_players/1
  # DELETE /award_players/1.json
  def destroy
    @award_player.destroy
    respond_to do |format|
      format.html {redirect_to "/award_infos/#{@award_player.award_info_id}/award_players_management", notice: '表彰選手情報の削除に成功しました。'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_award_player
    @award_player = AwardPlayer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def award_player_params
    params.require(:award_player).permit(:award_info_id, :award, :player, :team, :grade, :remarks, :order)
  end
end
