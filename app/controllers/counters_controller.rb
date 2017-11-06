class CountersController < ApplicationController
  def new
  end

  def index
    @donations1 = Donation.first
    @donations2 = Donation.last
    puts @donations1.counter
  end

  def update_counter
    if params[:donation_number].to_i == 1
      number = Donation.first.counter
      Donation.first.update(counter:number+1)
    else
      number = Donation.last.counter
      Donation.last.update(counter:number+1)
    end

    redirect_to "/"
  end

  def update_progress
    @donations1 = Donation.first.counter
    @donations2 = Donation.last.counter
    render :json => {donation1: @donations1, donation2: @donations2}
  end

  def donate
    number1 = Donation.first.counter
    Donation.first.update(counter:number1+1)
    number2 = Donation.last.counter
    Donation.last.update(counter:number2+1)

    render :json => {donation1: number1 + 1, donation2: number2 + 1}
  end

  def admin
    if Donation.first.nil?
      Donation.create(name:"Simplus",counter:0)
    end
    @count = Donation.first.counter
  end

  def admin_update
    Donation.first.update(counter:params[:count])
    redirect_to "/"
  end
end
