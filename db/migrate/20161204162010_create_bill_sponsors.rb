class CreateBillSponsors < ActiveRecord::Migration
  def change
    create_table :bill_sponsors do |t|
      t.references :bill, index: true, foreign_key: true
      t.references :sponsor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
