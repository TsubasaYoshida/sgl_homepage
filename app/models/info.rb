class Info < ApplicationRecord

  validates :disp_date, :article,
            presence: true

end
