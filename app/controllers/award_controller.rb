class AwardController < ApplicationController
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
      @award_info = AwardInfo.find_by(year: key_year, season: key_season, event: key_event)
      if @award_info
        @award_players = @award_info.award_players.order(order: :asc)
      else
        @error_msg = '該当の情報はございません。'
      end

      @selected_year = key_year
      @selected_season = key_season
      @selected_event = key_event
      render 'award/show'
    end
  end

  private def first
    @award_info = AwardInfo.order(year: :desc, season: :desc, event: :asc).first
    @award_players = @award_info.award_players.order(order: :asc)

    @selected_year = @award_info.year
    @selected_season = @award_info.season
    @selected_event = @award_info.event

    render 'award/show'
  end

end