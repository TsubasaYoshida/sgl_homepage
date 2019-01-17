class AwardInfosController < ApplicationController
  before_action :set_award_info, only: [:show, :edit, :update, :destroy]
  layout 'admin_sp_block'

  # GET /award_infos
  # GET /award_infos.json
  def index
    @award_infos = AwardInfo.all
  end

  # GET /award_infos/1
  # GET /award_infos/1.json
  def show
  end

  # GET /award_infos/new
  def new
    @award_info = AwardInfo.new
  end

  # GET /award_infos/1/edit
  def edit
  end

  # POST /award_infos
  # POST /award_infos.json
  def create
    @award_info = AwardInfo.new(award_info_params)

    respond_to do |format|
      if @award_info.save
        format.html {redirect_to @award_info, notice: 'Award info was successfully created.'}
        format.json {render :show, status: :created, location: @award_info}
      else
        format.html {render :new}
        format.json {render json: @award_info.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /award_infos/1
  # PATCH/PUT /award_infos/1.json
  def update
    respond_to do |format|
      if @award_info.update(award_info_params)
        format.html {redirect_to @award_info, notice: 'Award info was successfully updated.'}
        format.json {render :show, status: :ok, location: @award_info}
      else
        format.html {render :edit}
        format.json {render json: @award_info.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /award_infos/1
  # DELETE /award_infos/1.json
  def destroy
    @award_info.destroy
    respond_to do |format|
      format.html {redirect_to award_infos_url, notice: 'Award info was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_award_info
    @award_info = AwardInfo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def award_info_params
    params.require(:award_info).permit(
        :year, :season, :event,
        award_players_attributes: [
            :id, :award_info_id,
            :award, :player, :team, :grade, :remarks,
            :_destroy]
    )
  end
end
