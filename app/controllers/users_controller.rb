class UsersController < ApplicationController
  before_action :authenticate_view!
  def index
    @views = View.all
    # binding.pry
  end

  def profile
    @customers = Customer.all
  end

  def detail
    @customer = Customer.find_by_id(params[:id])
    # binding.pry
    # @booking = Booking.all
    # @workshop = Workshop.all
  end
end
