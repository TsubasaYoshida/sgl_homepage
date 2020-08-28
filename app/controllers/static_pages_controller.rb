class StaticPagesController < ApplicationController
  skip_before_action :check_logined

  def stop_covid19
  end

  def special_rules_2020_autumn
  end

  def replacement_battle_2020_autumn
  end
end
