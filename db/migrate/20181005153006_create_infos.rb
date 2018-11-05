class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.text :article

      t.timestamps
    end
  end
end
