class State < ActiveRecord::Base
  has_many :bills

  validate :name, presence: true
end
