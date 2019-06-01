class NitteiController < ApplicationController
  skip_before_action :check_logined

  def show
    first
  end

  def find
    @selected_year = params[:key_year]
    @selected_season = params[:key_season]
    @selected_event = params[:key_event]
    if @selected_year.nil? || @selected_season.nil? || @selected_event.nil?
      first
    else
      event_info = EventInfo.find_by(year: @selected_year, season: @selected_season, league: @selected_event)
      if event_info
        describe event_info
      else
        @error_msg = '該当の情報はございません。'
      end
      render :show
    end
  end

  private

  def first
    @selected_year = '2019'
    @selected_season = '春季'
    @selected_event = 'トーナメント'
    event_info = EventInfo.find_by(year: @selected_year, season: @selected_season, league: @selected_event)
    describe event_info
    render :show
  end

  def describe(event_info)
    @oc_date = event_info.oc_date
    @oc_time = event_info.oc_time
    if @selected_event.include?('リーグ戦')
      # 同じ日に異なるラウンドが入った時にどうするか
      @event_one_days_list = []
      @event_one_days_list << event_info.event_one_days.where(round_1: '第一節').order(disp_date: :asc)
      @event_one_days_list << event_info.event_one_days.where(round_1: '第二節').order(disp_date: :asc)
    elsif @selected_event == '入替戦' || @selected_event == 'トーナメント'
      @event_one_days = event_info.event_one_days.order(disp_date: :asc)
    end
    # 最終更新日時取得
    first_date = event_info.event_one_days.order(updated_at: :desc).first
    unless first_date.nil?
      @updated_at = first_date.updated_at
    end
  end

end
