class CreateBillActions < ActiveRecord::Migration
  def change
    create_table :bill_actions do |t|
      t.references :bill, index: true, foreign_key: true
      t.references :action, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
