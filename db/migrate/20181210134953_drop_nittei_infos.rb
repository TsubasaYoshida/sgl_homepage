class DropNitteiInfos < ActiveRecord::Migration[5.2]
  def change
    drop_table :nittei_infos
  end
end
