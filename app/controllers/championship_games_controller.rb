class ChampionshipGamesController < ApplicationController
  before_action :set_championship_game, only: [:score, :edit, :edit_game, :update, :destroy]
  layout 'admin'

  def management
    @championship = Championship.find(params[:championship_id])
    @championship_games = @championship.championship_games
  end

  def new
    @championship = Championship.find(params[:championship_id])
    @championship_game = ChampionshipGame.new
  end

  def score
  end

  def edit
  end

  def edit_game
  end

  def create
    @championship_game = ChampionshipGame.new(championship_game_params)
    @championship_game.championship = Championship.find(params[:championship_id])

    if @championship_game.save
      redirect_to management_championship_championship_games_url, notice: '代表決定戦試合情報の作成に成功しました。'
    else
      render :new
    end
  end

  def update
    if @championship_game.update(championship_game_params)
      redirect_to management_championship_championship_games_url, notice: '代表決定戦試合情報の更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @championship_game.destroy
    redirect_to management_championship_championship_games_url, notice: '代表決定戦試合情報の削除に成功しました。'
  end

  private

  def set_championship_game
    @championship = Championship.find(params[:championship_id])
    @championship_game = @championship.championship_games.find(params[:id])
  end

  def championship_game_params
    params.require(:championship_game).permit(:championship_id, :round, :date, :time, :stadium, :top_team, :bottom_team, :start_time, :end_time, :message, :rain_date, :no_game, :pitcher_top, :pitcher_bottom, :catcher_top, :catcher_bottom, :homerun_top, :homerun_bottom, :threebase_top, :threebase_bottom, :twobase_top, :twobase_bottom, :gameset_flag, :top1, :bottom1, :top2, :bottom2, :top3, :bottom3, :top4, :bottom4, :top5, :bottom5, :top6, :bottom6, :top7, :bottom7, :top8, :bottom8, :top9, :bottom9, :top10, :bottom10, :top11, :bottom11, :top12, :bottom12, :top13, :bottom13, :top14, :bottom14, :top15, :bottom15)
  end
end
