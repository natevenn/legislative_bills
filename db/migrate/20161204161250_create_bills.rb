class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.text :title
      t.text :description
      t.string :state

      t.timestamps null: false
    end
  end
end
