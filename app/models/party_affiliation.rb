class PartyAffiliation < ActiveRecord::Base
  has_many :sponsors

  validates :name, presence: true
end
