class ChampionshipsController < ApplicationController
  before_action :set_championship, only: [:edit, :update, :destroy]
  skip_before_action :check_logined, only: :index
  layout 'admin', except: :index

  def index
    @championship =
      if params[:year]
        Championship.find_by(year: params[:year])
      else
        Championship.order(year: :desc).first
      end
  end

  def management
    @championships = Championship.all
  end

  def new
    @championship = Championship.new
  end

  def edit
  end

  def create
    @championship = Championship.new(championship_params)

    if @championship.save
      redirect_to management_championships_url, notice: '代表決定戦情報の作成に成功しました。'
    else
      render :new
    end
  end

  def update
    if @championship.update(championship_params)
      redirect_to management_championships_url, notice: '代表決定戦情報の更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @championship.destroy
    redirect_to management_championships_url, notice: '代表決定戦情報の削除に成功しました。'
  end

  private

  def set_championship
    @championship = Championship.find(params[:id])
  end

  def championship_params
    params.require(:championship).permit(:year, :oc_date, :oc_time)
  end
end
