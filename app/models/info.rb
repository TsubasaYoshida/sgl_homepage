class Info < ApplicationRecord

  validates :disp_date, :article,
            presence: true

  default_scope {order(disp_date: :desc, updated_at: :desc)}

end
