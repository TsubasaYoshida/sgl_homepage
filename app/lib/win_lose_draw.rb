class WinLoseDraw
  attr_accessor :team_name,
                :playoff_win,
                :playoff_lose,
                :playoff_draw,
                :point,
                :playoff_point,
                :rank,
                :three_letter_name,
                :two_letter_name,
                :one_letter_name,
                :disp_win,
                :disp_lose,
                :disp_draw

  def initialize
    @playoff_win = 0
    @playoff_lose = 0
    @playoff_draw = 0
    @point = 0
    @playoff_point = 0
    @disp_win = 0
    @disp_lose = 0
    @disp_draw = 0
  end
end