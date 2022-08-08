class CheckoutsController < ApplicationController
  
  before_action :authenticate_view!
  # def show
  #   current_view.processor = :stripe 
  #   current_view.customer
    
  #   @checkout_session = current_view.payment_processor.checkout(
  #     # mode: "payment",
  #     # line_items: "price_1LTOgTFw4uYMCAh05crwfdrr"
  #     mode: "subscription",
  #     line_items: "default"
  #   ) 
  # end
  def create
    workshop = Workshop.find(params[:id])
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        name: workshop.name,
        amount: workshop.registration_fee,
        currency: "usd",
        quantity: 1
      }],
      mode: 'payment',
      success_url: root_url,
      cancel_url: root_url,
    })
    respond_to do |format|
      
      format.js
    end
  end
end
