class ChampionshipAwardsController < ApplicationController
  before_action :set_championship_award, only: [:edit, :update, :destroy]
  layout 'admin'

  def management
    @championship_awards = ChampionshipAward.all
  end

  def new
    @championship_award = ChampionshipAward.new
  end

  def edit
  end

  def create
    @championship_award = ChampionshipAward.new(championship_award_params)

    if @championship_award.save
      redirect_to management_championship_championship_awards_url, notice: '代表決定戦表彰情報の作成に成功しました。'
    else
      render :new
    end
  end

  def update
    if @championship_award.update(championship_award_params)
      redirect_to management_championship_championship_awards_url, notice: '代表決定戦表彰情報の更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @championship_award.destroy
    redirect_to management_championship_championship_awards_url, notice: '代表決定戦表彰情報の削除に成功しました。'
  end

  private

  def set_championship_award
    @championship_award = ChampionshipAward.find(params[:id])
  end

  def championship_award_params
    params.require(:championship_award).permit(:championship_id, :award, :player, :team, :grade, :remarks, :disp_id)
  end
end
