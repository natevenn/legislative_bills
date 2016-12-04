class Action < ActiveRecord::Base
  has_many :bill_actions, dependent: :destroy
  has_many :bills, through: :bill_actions

  validates :name, presence: true
end
