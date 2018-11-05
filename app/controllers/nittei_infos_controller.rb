class NitteiInfosController < ApplicationController
  before_action :set_nittei_info, only: [:show, :edit, :update, :destroy]

  # GET /nittei_infos
  # GET /nittei_infos.json
  def index
    @nittei_infos = NitteiInfo.all
  end

  # GET /nittei_infos/1
  # GET /nittei_infos/1.json
  def show
  end

  # GET /nittei_infos/new
  def new
    @nittei_info = NitteiInfo.new
  end

  # GET /nittei_infos/1/edit
  def edit
  end

  # POST /nittei_infos
  # POST /nittei_infos.json
  def create
    @nittei_info = NitteiInfo.new(nittei_info_params)

    respond_to do |format|
      if @nittei_info.save
        format.html {redirect_to @nittei_info, notice: 'Nittei info was successfully created.'}
        format.json {render :show, status: :created, location: @nittei_info}
      else
        format.html {render :new}
        format.json {render json: @nittei_info.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /nittei_infos/1
  # PATCH/PUT /nittei_infos/1.json
  def update
    respond_to do |format|
      if @nittei_info.update(nittei_info_params)
        format.html {redirect_to @nittei_info, notice: 'Nittei info was successfully updated.'}
        format.json {render :show, status: :ok, location: @nittei_info}
      else
        format.html {render :edit}
        format.json {render json: @nittei_info.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /nittei_infos/1
  # DELETE /nittei_infos/1.json
  def destroy
    @nittei_info.destroy
    respond_to do |format|
      format.html {redirect_to nittei_infos_url, notice: 'Nittei info was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_nittei_info
    @nittei_info = NitteiInfo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def nittei_info_params
    params.require(:nittei_info).permit(:event, :season, :disp_date, :stadium,
                                        :round_1, :top_team_1, :bottom_team_1, :start_time_1, :message_1,
                                        :round_2, :top_team_2, :bottom_team_2, :start_time_2, :message_2,
                                        :round_3, :top_team_3, :bottom_team_3, :start_time_3, :message_3,
                                        :rain_date_flag)
  end
end
