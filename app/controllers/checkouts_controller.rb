class CheckoutsController < ApplicationController
  before_action :authenticate_view!

  # def show
  #   current_view.set_payment_processor :stripe
  #   current_view.payment_processor.customer
  #   @checkout_session = current_view.payment_processor.checkout(
  #     mode: params[:payment_mode],
  #     line_items: params[:line_items],
  #     success_url: checkout_success_url
  #   )
  #   respond_to do |format|
  #     # @session.url
  #     format.html
  #     format.js
  #   end                      
  # end

  def cancel
  end
  
  def success
    @session_with_expand = Stripe::Checkout::Session.retrieve({ id: params[:session_id], expand: ["line_items"]})
 
    # @workshop = Workshop.all
  end

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
      # success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
      success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: cancel_url,
    })
    respond_to do |format|
      @session.url
      format.html
      format.js
    end
  end
end
