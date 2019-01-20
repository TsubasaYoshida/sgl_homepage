class AwardPlayer < ApplicationRecord
  belongs_to :award_info

  def get_position
    return self[:award].tr("ベストナイン ", "")
  end

end
