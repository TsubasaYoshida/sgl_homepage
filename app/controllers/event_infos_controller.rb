class EventInfosController < ApplicationController
  before_action :set_event_info, only: [:show, :edit, :one_days_management, :update, :destroy]
  layout 'admin_sp_block'

  # GET /event_infos
  # GET /event_infos.json
  def index
    @event_infos = EventInfo.all
  end

  # GET /event_infos/1
  # GET /event_infos/1.json
  def show
  end

  # GET /event_infos/new
  def new
    @event_info = EventInfo.new
  end

  # GET /event_infos/1/edit
  def edit
  end

  # GET /event_infos/1/one_days_management
  def one_days_management
    @event_one_days = EventOneDay.where(event_info_id: @event_info).order(disp_date: :asc)
  end

  # POST /event_infos
  # POST /event_infos.json
  def create
    @event_info = EventInfo.new(event_info_params)

    respond_to do |format|
      if @event_info.save
        format.html {redirect_to @event_info, notice: 'Event info was successfully created.'}
        format.json {render :show, status: :created, location: @event_info}
      else
        format.html {render :new}
        format.json {render json: @event_info.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /event_infos/1
  # PATCH/PUT /event_infos/1.json
  def update
    respond_to do |format|
      if @event_info.update(event_info_params)
        format.html {redirect_to @event_info, notice: 'Event info was successfully updated.'}
        format.json {render :show, status: :ok, location: @event_info}
      else
        format.html {render :edit}
        format.json {render json: @event_info.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /event_infos/1
  # DELETE /event_infos/1.json
  def destroy
    @event_info.destroy
    respond_to do |format|
      format.html {redirect_to event_infos_url, notice: 'Event info was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event_info
    @event_info = EventInfo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_info_params
    params.require(:event_info).permit(
        :year, :season, :league,
        event_one_days_attributes: [
            :id, :event_info_id, :disp_date, :stadium,
            :round_1, :top_team_1, :bottom_team_1, :start_time_1, :message_1,
            :round_2, :top_team_2, :bottom_team_2, :start_time_2, :message_2,
            :round_3, :top_team_3, :bottom_team_3, :start_time_3, :message_3,
            :rain_date_flag, :_destroy]
    )
  end
end
