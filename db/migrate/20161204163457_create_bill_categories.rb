class CreateBillCategories < ActiveRecord::Migration
  def change
    create_table :bill_categories do |t|
      t.references :bill, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
