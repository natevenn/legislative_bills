class Sponsor < ActiveRecord::Base
  belongs_to :party_affiliation
  has_many :bill_sponsors, dependent: :destroy
  has_many :bills, through: :bill_sponsors

  validates :first_name, presence: true
  validates :last_name, presence: true
end
