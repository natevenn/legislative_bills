class BillAction < ActiveRecord::Base
  belongs_to :bill
  belongs_to :action
end
