class TopController < ApplicationController
  def show
    @infos = Info.limit(5).order(disp_date: :DESC)
    @game_infos = GameInfo.limit(5).order(disp_date: :DESC)
  end
end
