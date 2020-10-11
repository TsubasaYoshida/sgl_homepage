class Championship < ApplicationRecord
  has_many :championship_games, dependent: :destroy
  has_many :championship_awards, dependent: :destroy

  def self.years_for_select
    years_for_select = self.order(year: :desc).pluck(:year).map do |year|
      [
        "第#{year.to_i - 2008}回(#{year})", year
      ]
    end
    index = years_for_select.find_index { |pair| pair[1].to_i == 2020 }
    years_for_select[index] = %w[王座決定戦(2020) 2020]
    years_for_select
  end
end
