class AddThreeLetterNameToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :three_letter_name, :string
  end
end
