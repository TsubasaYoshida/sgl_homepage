class InfosController < ApplicationController
  skip_before_action :check_logined, only: [:index]
  before_action :set_info, only: [:show, :edit, :update, :destroy]
  layout 'admin', :except => [:index, :show]

  def index
    @infos = Info.all.order(disp_date: :desc)
  end

  def show
  end

  def new
    @info = Info.new
  end

  def edit
  end

  def management
    @infos = Info.all.order(disp_date: :desc)
  end

  def create
    @info = Info.new(info_params)

    if @info.save
      redirect_to action: :management, notice: '新着情報の作成に成功しました。'
    else
      render :new
    end
  end

  def update
    if @info.update(info_params)
      redirect_to action: :management, notice: '新着情報の更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @info.destroy
    redirect_to action: :management, notice: '新着情報の削除に成功しました。'
  end

  private

  def set_info
    @info = Info.find(params[:id])
  end

  def info_params
    params.require(:info).permit(:article, :disp_date)
  end
end
