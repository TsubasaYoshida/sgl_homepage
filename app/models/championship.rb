class Championship < ApplicationRecord
  has_many :championship_games, dependent: :destroy
  has_many :championship_awards, dependent: :destroy

  def self.years_for_select
    self.order(year: :desc).pluck(:year).map do |year|
      [
        "第#{year.to_i - 2008}回(#{year})", year
      ]
    end
  end
end
