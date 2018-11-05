class AddRound1ToNitteiInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :nittei_infos, :round_1, :string
    add_column :nittei_infos, :round_2, :string
    add_column :nittei_infos, :round_3, :string
  end
end
