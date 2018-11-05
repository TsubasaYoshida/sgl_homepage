class AddTwoLetterNameToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :two_letter_name, :string
  end
end
