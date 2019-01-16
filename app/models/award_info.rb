class AwardInfo < ApplicationRecord
  has_many :award_players, dependent: :destroy
  accepts_nested_attributes_for :award_players, allow_destroy: true
end
