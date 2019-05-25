class Team < ApplicationRecord
  belongs_to :league

  def self.get_three_letter(name)
    Team.find_by(name: name) ? Team.find_by(name: name).three_letter_name : name
  end

  def self.get_two_letter(name)
    Team.find_by(name: name) ? Team.find_by(name: name).two_letter_name : name
  end
end
