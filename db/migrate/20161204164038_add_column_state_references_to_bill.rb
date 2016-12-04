class AddColumnStateReferencesToBill < ActiveRecord::Migration
  def change
    add_reference :bills, :state, index: true, foreign_key: true
  end
end
