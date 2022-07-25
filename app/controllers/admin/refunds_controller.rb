class Admin::RefundsController < AdminController 
  before_action :set_refund

	def process_refund_1
		@refund = Refund.find(params[:id])
		stripe_service = StripeService.new
    @refund.amount_refunded = @refund.amount_to_be_refunded
		stripe_charge_id = @refund.booking.stripe_transaction_id
		stripe_refund = stripe_service.create_stripe_refund(stripe_charge_id, @refund.amount_to_be_refunded)
		if @refund.amount_refunded == @refund.booking.amount_paid
			@refund.is_partial_refund = false
		elsif @refund.amount_refunded < @refund.booking.amount_paid
      @refund.is_partial_refund = true 
		end
		@refund.state = 'success'
		@refund.save
		redirect_to admin_dashboard_path, notice: 'Refund processed successfully'
	rescue Stripe::StripeError => error
		redirect_to admin_dashboard_path, alert: error.message
	end 

	private
  
	def set_refund
    @refund = Refund.find(params[:id])
	end
end
