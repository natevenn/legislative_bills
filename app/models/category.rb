class Category < ActiveRecord::Base
  has_many :bill_categories, dependent: :destroy
  has_many :bills, through: :bill_categories

  validates :name, presence: true
  validates :classification, presence: true
end
