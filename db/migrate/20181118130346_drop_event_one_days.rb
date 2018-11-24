class DropEventOneDays < ActiveRecord::Migration[5.2]
  def change
    drop_table :event_one_days
  end
end
