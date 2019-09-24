class Championship < ApplicationRecord
  has_many :championship_games, dependent: :destroy
  has_many :championship_awards, dependent: :destroy
end
