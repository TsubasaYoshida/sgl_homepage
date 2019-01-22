class TeamController < ApplicationController
  def show
    @leagues = League.all
  end
end
