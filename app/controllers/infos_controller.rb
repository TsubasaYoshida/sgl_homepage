class InfosController < ApplicationController
  skip_before_action :check_logined, only: [:index]
  before_action :set_info, only: [:show, :edit, :update, :destroy]
  layout 'admin', :except => [:index, :show]

  # GET /infos
  # GET /infos.json
  def index
    @infos = Info.all.order(disp_date: :desc)
  end

  # GET /infos/1
  # GET /infos/1.json
  def show
  end

  # GET /infos/new
  def new
    @info = Info.new
  end

  # GET /infos/1/edit
  def edit
  end

  # GET /infos/management
  def management
    @infos = Info.all.order(disp_date: :desc)
  end

  # POST /infos
  # POST /infos.json
  def create
    @info = Info.new(info_params)

    respond_to do |format|
      if @info.save
        format.html {redirect_to '/infos/management', notice: '新着情報の作成に成功しました。'}
        format.json {render :show, status: :created, location: @info}
      else
        format.html {render :new}
        format.json {render json: @info.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /infos/1
  # PATCH/PUT /infos/1.json
  def update
    respond_to do |format|
      if @info.update(info_params)
        format.html {redirect_to '/infos/management', notice: '新着情報の更新に成功しました。'}
        format.json {render :show, status: :ok, location: @info}
      else
        format.html {render :edit}
        format.json {render json: @info.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /infos/1
  # DELETE /infos/1.json
  def destroy
    @info.destroy
    respond_to do |format|
      format.html {redirect_to '/infos/management', notice: '新着情報の削除に成功しました。'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_info
    @info = Info.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def info_params
    params.require(:info).permit(:article, :disp_date)
  end
end
