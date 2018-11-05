class GameInfosController < ApplicationController
  before_action :set_game_info, only: [:show, :edit, :score, :update, :destroy]

  # GET /game_infos
  # GET /game_infos.json
  def index
    @game_infos = GameInfo.all.order(disp_date: :desc, gameset_flag: :asc, number: :desc)
  end

  # GET /game_infos/1
  # GET /game_infos/1.json
  def show
  end

  # GET /game_infos/new
  def new
    @game_info = GameInfo.new
  end

  # GET /game_infos/1/edit
  def edit
  end

  # GET /game_infos/1/score
  def score
  end

  # POST /game_infos
  # POST /game_infos.json
  def create
    @game_info = GameInfo.new(game_info_params)

    respond_to do |format|
      if @game_info.save
        format.html { redirect_to @game_info, notice: '試合情報の作成に成功しました。' }
        format.json { render :show, status: :created, location: @game_info }
      else
        format.html { render :new }
        format.json { render json: @game_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_infos/1
  # PATCH/PUT /game_infos/1.json
  def update
    respond_to do |format|
      if @game_info.update(game_info_params)
        format.html { redirect_to @game_info, notice: '試合情報の更新に成功しました。' }
        format.json { render :show, status: :ok, location: @game_info }
      else
        format.html { render :edit }
        format.json { render json: @game_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_infos/1
  # DELETE /game_infos/1.json
  def destroy
    @game_info.destroy
    respond_to do |format|
      format.html { redirect_to game_infos_url, notice: '試合情報の削除に成功しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_info
      @game_info = GameInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_info_params
      params.require(:game_info).permit(:season, :event, :round, :disp_date, :batting_first_team, :field_first_team, :stadium, :number, :start_time, :end_time, :pitcher_top, :pitcher_bottom, :catcher_top, :catcher_bottom, :homerun_top, :homerun_bottom, :threebase_top, :threebase_bottom, :twobase_top, :twobase_bottom, :message, :top1, :bottom1, :top2, :bottom2, :top3, :bottom3, :top4, :bottom4, :top5, :bottom5, :top6, :bottom6, :top7, :bottom7, :top8, :bottom8, :top9, :bottom9, :top10, :bottom10, :top11, :bottom11, :top12, :bottom12, :top13, :bottom13, :top14, :bottom14, :top15, :bottom15, :gameset_flag)
    end
end
