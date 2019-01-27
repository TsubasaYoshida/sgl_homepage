class AddOcDateToEventInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :event_infos, :oc_date, :date
    add_column :event_infos, :oc_time, :time
  end
end
