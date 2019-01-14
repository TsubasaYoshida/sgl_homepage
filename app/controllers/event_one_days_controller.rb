class EventOneDaysController < ApplicationController
  before_action :set_event_one_day, only: [:show, :edit, :update, :destroy]
  layout 'admin_sp_block'

  # GET /event_one_days
  # GET /event_one_days.json
  def index
    @event_one_days = EventOneDay.all
  end

  # GET /event_one_days/1
  # GET /event_one_days/1.json
  def show
  end

  # GET /event_one_days/new
  def new
    @event_one_day = EventOneDay.new
  end

  # GET /event_one_days/1/edit
  def edit
  end

  # POST /event_one_days
  # POST /event_one_days.json
  def create
    @event_one_day = EventOneDay.new(event_one_day_params)

    respond_to do |format|
      if @event_one_day.save
        format.html { redirect_to @event_one_day, notice: 'Event one day was successfully created.' }
        format.json { render :show, status: :created, location: @event_one_day }
      else
        format.html { render :new }
        format.json { render json: @event_one_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_one_days/1
  # PATCH/PUT /event_one_days/1.json
  def update
    respond_to do |format|
      if @event_one_day.update(event_one_day_params)
        format.html { redirect_to @event_one_day, notice: 'Event one day was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_one_day }
      else
        format.html { render :edit }
        format.json { render json: @event_one_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_one_days/1
  # DELETE /event_one_days/1.json
  def destroy
    @event_one_day.destroy
    respond_to do |format|
      format.html { redirect_to event_one_days_url, notice: 'Event one day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_one_day
      @event_one_day = EventOneDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_one_day_params
      params.require(:event_one_day).permit(:event_info_id, :disp_date, :stadium, :round_1, :top_team_1, :bottom_team_1, :start_time_1, :message_1, :round_2, :top_team_2, :bottom_team_2, :start_time_2, :message_2, :round_3, :top_team_3, :bottom_team_3, :start_time_3, :message_3, :rain_date_flag)
    end
end
