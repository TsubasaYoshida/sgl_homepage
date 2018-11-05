class WinLoseDraw
  attr_accessor :team_name,
                :win,
                :lose,
                :draw,
                :point,
                :rank,
                :three_letter_name,
                :two_letter_name,
                :one_letter_name

  def initialize
    @win = 0
    @lose = 0
    @draw = 0
    @point = 0
  end
end