class NitteiController < ApplicationController

  def show
    first
  end

  def find
    key_year = params[:key_year]
    key_season = params[:key_season]
    key_event = params[:key_event]
    if key_year.nil? || key_season.nil? || key_event.nil?
      first
    else
      event_info = EventInfo.find_by(year: key_year, season: key_season, league: key_event)

      # 同じ日に異なるラウンドが入った時にどうするか
      @nittei_infos_1 = event_info.event_one_days.where(round_1: '第一節').order(disp_date: :asc)
      @nittei_infos_2 = event_info.event_one_days.where(round_1: '第二節').order(disp_date: :asc)

      @selected_year = key_year
      @selected_season = key_season
      @selected_event = key_event
      @oc_date = event_info.oc_date
      @oc_time = event_info.oc_time
      render 'nittei/show'
    end
  end

  private def first
    event_info = EventInfo.order(year: :desc, season: :desc).first

    @selected_year = event_info.year
    @selected_season = event_info.season
    @selected_event = event_info.league
    @oc_date = event_info.oc_date
    @oc_time = event_info.oc_time

    event_info = EventInfo.find_by(year: @selected_year, season: @selected_season, league: @selected_event)

    # 同じ日に異なるラウンドが入った時にどうするか
    @nittei_infos_1 = event_info.event_one_days.where(round_1: '第一節').order(disp_date: :asc)
    @nittei_infos_2 = event_info.event_one_days.where(round_1: '第二節').order(disp_date: :asc)

    render 'nittei/show'
  end

end
