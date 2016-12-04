class RemoveColumnStateFromBill < ActiveRecord::Migration
  def change
    remove_column :bills, :state, :string
  end
end
