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

  def self.create_bill_with_associations(params)
    bill = Bill.create(params[:bill])
    associate_with_state(bill, params)
    associate_with_action(bill, params)
    associate_with_categories(bill, params)
    associate_with_sponsors(bill, params)
    bill
  end

  def self.associate_with_state(bill, params)
    state = State.find_by(name: params[:state][:name])
    bill.update(state_id: state.id)
  end

  def self.associate_with_action(bill, params)
    #for multiple actions iterate over the array of actions
    #refactor this logic to the action model
    bill << Action.find_or_create_by(params[:action])
  end

  def self.associate_with_sponsor(bill, params)
    #for multiple sponsors iterate over the array of sposnors
    #refactor this logic to the sponsor model
    party = PartyAffiliation.find(params[:party_affiliation])
    sponsor = bill << Sponsors.find_or_create(params[:sponsor])
    sponsor.update(party_affiliation_id: party.id)
  end

  def self.associate_with_categories(bill, params)
    #for multiple categores iterate over the array of categores
    #refactor this logic to the categories model
    bill << Categories.find_or_create_by(params[:category])
  end

  def update_with_associations(params)
    #find out what has changes i.e was it an action, category, new sponsor
    # send object to the appropriate model to be updated or created
    # update the appropriate object by scoping from bill to that object
    # if update to the bill was a new action or new category send email
    # add bill.id to the audit associated with the object that was updated
    # if update success, return true
  end
end
