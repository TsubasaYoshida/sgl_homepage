class AddHpLinkToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :hp_team, :string
    add_column :teams, :hp_college, :string
  end
end
