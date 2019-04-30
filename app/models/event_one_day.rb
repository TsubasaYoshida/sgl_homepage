class EventOneDay < ApplicationRecord
  belongs_to :event_info

  def self.make_team_select_box
    leagues = League.all.order(name: :asc)
    select_box = []

    leagues.each do |league|
      league_teams = []
      league_teams << league.name
      league_teams << league.teams.pluck(:name)
      select_box << league_teams
    end

    select_box << ['入替戦', ['1部6位', '2部1位', '2部6位', '3部1位']]
  end

end
