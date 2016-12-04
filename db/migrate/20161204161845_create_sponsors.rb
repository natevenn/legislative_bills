class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :first_name
      t.string :last_name
      t.references :party_affiliation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
