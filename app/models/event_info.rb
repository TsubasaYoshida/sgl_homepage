class EventInfo < ApplicationRecord
  has_many :event_one_days, dependent: :destroy
  accepts_nested_attributes_for :event_one_days, allow_destroy: true
end
