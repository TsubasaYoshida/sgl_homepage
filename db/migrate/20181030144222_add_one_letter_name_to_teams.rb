class AddOneLetterNameToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :one_letter_name, :string
  end
end
