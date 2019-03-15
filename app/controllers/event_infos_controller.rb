class EventInfosController < ApplicationController
  before_action :set_event_info, only: [:show, :edit, :one_days_management, :update, :destroy]
  layout 'admin_sp_block'

  def index
    @event_infos = EventInfo.all
  end

  def show
  end

  def new
    @event_info = EventInfo.new
  end

  def edit
  end

  def one_days_management
    @event_one_days = EventOneDay.where(event_info_id: @event_info).order(disp_date: :asc)
  end

  def create
    @event_info = EventInfo.new(event_info_params)

    if @event_info.save
      redirect_to event_infos_url, notice: '大会情報の作成に成功しました。'
    else
      render :new
    end
  end

  def update
    if @event_info.update(event_info_params)
      redirect_to event_infos_url, notice: '大会情報の更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @event_info.destroy
    redirect_to event_infos_url, notice: '大会情報の削除に成功しました。'
  end

  private

  def set_event_info
    @event_info = EventInfo.find(params[:id])
  end

  def event_info_params
    params.require(:event_info).permit(
        :year, :season, :league, :oc_date, :oc_time,
        event_one_days_attributes: [
            :id, :event_info_id, :disp_date, :stadium,
            :round_1, :top_team_1, :bottom_team_1, :start_time_1, :message_1,
            :round_2, :top_team_2, :bottom_team_2, :start_time_2, :message_2,
            :round_3, :top_team_3, :bottom_team_3, :start_time_3, :message_3,
            :rain_date_flag, :_destroy]
    )
  end
end
