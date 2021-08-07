class StaticPagesController < ApplicationController
  skip_before_action :check_logined

  def stop_covid19
  end

  def special_rules
  end

  def replacement_battle_2020_autumn
  end

  def calling_off_2021_spring
  end
end
