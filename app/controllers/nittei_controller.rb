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
      @nittei_infos = NitteiInfo.where(season: key_season, event: key_event).where('disp_date LIKE ?', "#{key_year}%").order(disp_date: :asc)
      @selected_year = key_year
      @selected_season = key_season
      @selected_event = key_event
      render 'nittei/show'
    end
  end

  private def first
    @nittei_info = NitteiInfo.order(disp_date: :desc).first
    @selected_year = @nittei_info.disp_date.year
    @selected_season = @nittei_info.season
    @selected_event = @nittei_info.event

    @nittei_infos = NitteiInfo
                        .where(season: @selected_season, event: @selected_event)
                        .where('disp_date LIKE ?', "#{@selected_year}%")
                        .order(disp_date: :asc)

    render 'nittei/show'
  end

end
