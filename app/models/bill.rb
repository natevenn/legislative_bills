class Bill < ActiveRecord::Base
  belongs_to :state
  has_many :bill_actions, dependent: :destroy
  has_many :bill_sponsors, dependent: :destroy
  has_many :bill_categories, dependent: :destroy
  has_many :actions, through: :bill_actions
  has_many :sponsors, through: :bill_sponsors
  has_many :categories, through: :bill_categories

  validates :title, presence: true
  validates :description, presence: true
end
