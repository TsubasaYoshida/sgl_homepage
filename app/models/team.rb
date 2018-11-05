class Team < ApplicationRecord
  belongs_to :league

  def self.get_three_letter(name)
    team = Team.find_by(name: name)
    return team.three_letter_name
  end
end
