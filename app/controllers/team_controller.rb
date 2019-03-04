class TeamController < ApplicationController
  skip_before_action :check_logined

  def show
    @leagues = League.all
    @organizations = Organization.all
  end
end
