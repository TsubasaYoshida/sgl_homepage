class InfosController < ApplicationController
  skip_before_action :check_logined, only: [:index]
  before_action :set_info, only: [:edit, :update, :destroy]
  layout 'admin', :except => [:index, :page]

  PAGE_SIZE = 2

  def index
    @infos = Info.all.order(disp_date: :desc).limit(PAGE_SIZE)
    @count = (Info.all.order(disp_date: :desc).size.to_f / PAGE_SIZE).ceil
    @current = 1
  end

  def page
    infos = Info.all.order(disp_date: :desc)
    page_common(infos)
    render :index
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

  def page_common(infos)
    page_num = params[:id] == nil ? 0 : params[:id].to_i - 1
    @infos = infos.limit(PAGE_SIZE).offset(PAGE_SIZE * page_num)
    @count = (infos.size.to_f / PAGE_SIZE).ceil
    @current = params[:id] == nil ? 1 : params[:id].to_i
  end

  def set_info
    @info = Info.find(params[:id])
  end

  def info_params
    params.require(:info).permit(:article, :disp_date)
  end
end
