class BillsController < ApplicationController
  def new
    @bill = Bill.new
    @state = State.all
    @action = Action.all
    @category = Category.all
    @sponsor = Sponsor.new
    @party_affiliation = PartyAffiliation.all
  end

  def create
    bill = Bill.create_with_associations(bill_params[:bill])
    if bill.save
      flash[:info] = "some message"
      redirect_to bill_path(bill)
    else
      flash[:alert] = "some error message"
      render :new
    end
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def index
    @bill = Bill.all
  end

  def edit
    @bill = Bill.find(params[:id])
    @action = @bill.actions
    @category = @bill.categories
    @sponsor = @bill.sponsors
    @party_affiliation = @sponsor.party_affiliation
  end

  def update
    bill = Bill.find(params[:id])
    if bill.update_with_associations(bill_params[:bill])
      flash[:info] = "some message"
      redirect_to bill_path(bill)
    else
      flash[:alert] = "some error message"
      render :edit
    end
  end

  def destroy
    Bill.find(params[:id]).delete
  end

  private

    def bill_params
      params.require(:bill).permit(:title, :description, state: [:name], action: [:name], category: [:name, :classification], sponsor: [:first_name, :last_name, party_affiliation: [:name]])
    end
end
