class CheckoutsController < ApplicationController
  before_action :authenticate_view!

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
      success_url: root_url(success: true),
      cancel_url: root_url,
    })
    respond_to do |format|
      # @session.url
      format.html
      format.js
    end
  end
end
