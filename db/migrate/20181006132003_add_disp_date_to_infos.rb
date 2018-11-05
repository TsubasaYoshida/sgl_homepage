class AddDispDateToInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :infos, :disp_date, :date
  end
end
