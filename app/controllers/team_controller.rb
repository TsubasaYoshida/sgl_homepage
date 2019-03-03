class TeamController < ApplicationController
  def show
    @leagues = League.all
    @organizations = Organization.all
  end
end
