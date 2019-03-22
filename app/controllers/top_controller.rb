class TopController < ApplicationController
  skip_before_action :check_logined

  def show
    @infos = Info.limit(5).order(disp_date: :DESC)
    @game_infos = GameInfo.standard.limit(5)
  end
end
