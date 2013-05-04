class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :team_city
      t.string :age_group
      t.boolean :entry_fee_paid
      t.integer :no_of_players

      t.timestamps
    end
  end
end
