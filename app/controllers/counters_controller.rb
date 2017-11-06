class CountersController < ApplicationController
  def new
  end

  def index
    @donations1 = Donation.find(1)
    @donations2 = Donation.find(2)
  end

  def update_progress
    @donations1 = Donation.find(1).counter
    @donations2 = Donation.find(2).counter
    render :json => {donation1: @donations1, donation2: @donations2}
  end

  def donate
    if params[:charity] == "water"
      number = Donation.find(1).counter
      Donation.find(1).update(counter:number+1)
    else
      number = Donation.find(2).counter
      Donation.find(2).update(counter:number+1)
    end
    render :json => {donation: number + 1}
  end

  def admin
    if Donation.find_by_id(1).nil?
      Donation.create(name:"Water.org",counter:0)
    end
    if Donation.find_by_id(2).nil?
      Donation.create(name:"Educated Refugee Foundation",counter:0)
    end
    @org1 = Donation.find(1)
    @org2 = Donation.find(2)
  end

  def admin_update
    Donation.find(1).update(name:params[:name1],counter:params[:count1].to_i)
    Donation.find(2).update(name:params[:name2],counter:params[:count2].to_i)
    redirect_to "/"
  end
end
