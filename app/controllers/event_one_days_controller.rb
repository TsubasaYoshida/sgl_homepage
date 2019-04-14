class EventOneDaysController < ApplicationController
  before_action :set_event_one_day, only: [:show, :edit, :update, :destroy]
  layout 'admin_sp_block'

  def index
    @event_one_days = EventOneDay.all
  end

  def show
  end

  def new_one_day
    @event_one_day = EventOneDay.new
    @event_info_id = params[:id]
  end

  def edit
  end

  def create
    @event_one_day = EventOneDay.new(event_one_day_params)

    if @event_one_day.save
      redirect_to "/event_infos/#{@event_one_day.event_info_id}/one_days_management", notice: '日程情報の追加に成功しました。'
    else
      render :new_one_day
    end
  end

  def update
    if @event_one_day.update(event_one_day_params)
      redirect_to "/event_infos/#{@event_one_day.event_info_id}/one_days_management", notice: '日程情報の更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @event_one_day.destroy
    redirect_to "/event_infos/#{@event_one_day.event_info_id}/one_days_management", notice: '日程情報の削除に成功しました。'

  end

  private

  def set_event_one_day
    @event_one_day = EventOneDay.find(params[:id])
  end

  def event_one_day_params
    params.require(:event_one_day).permit(:event_info_id, :disp_date, :stadium,
                                          :round_1, :top_team_1, :bottom_team_1, :start_time_1, :message_1, :no_game_1,
                                          :round_2, :top_team_2, :bottom_team_2, :start_time_2, :message_2, :no_game_2,
                                          :round_3, :top_team_3, :bottom_team_3, :start_time_3, :message_3, :no_game_3,
                                          :rain_date_flag)
  end
end
