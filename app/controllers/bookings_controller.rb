class BookingsController < ApplicationController
  before_action :authenticate_view!
  # after_action:send_message

  def create
    @stripe_service = StripeService.new
    @workshop = Workshop.find(params[:workshop_id])
    @customer = Customer.find_by(email: params[:email])
    unless @customer.present?
      @customer = Customer.create(customer_params)
    end
    @stripe_customer = @stripe_service.
      find_or_create_customer(@customer)

    @card = @stripe_service.create_stripe_customer_card(card_token_params, @stripe_customer)

    @amount_to_be_paid = params[:no_of_tickets].to_i * @workshop.registration_fee

    @charge = @stripe_service.create_stripe_charge(@amount_to_be_paid, @stripe_customer.id, @card.id, @workshop)

    @booking = @workshop.bookings.new(
      customer_id: @customer.id,
      stripe_transaction_id: @charge.id,
      no_of_tickets: params[:no_of_tickets].to_i,
      amount_paid: @amount_to_be_paid,
    )

    if @booking.save
      # binding.pry
      BookingsMailer.booking_confirmation(@booking).deliver_now
      
      TwilioSms.send_text(@customer.contact_number, "Congrulations 🥳🎉..You have successfully booked an course" ) 
      # TwilioSms.send_text({
      #   from: ENV['TWILIO_PHONE_NUMBER'],
      #   to: '917991168428',
      #   body: "Congrulations 🥳🎉..You have successfully booked an course"
      # })
    
      redirect_to workshop_path(@workshop), notice: "Congrulations 🥳🎉..You have successfully booked an course"
    else
      @stripe_service.create_stripe_refund(@charge.id)
      redirect_to workshop_path(@workshop), notice: "Something went wrong ❎❎.. Don't worry your money will be refunded shortly"
      
    end

  rescue Stripe::StripeError => error
    redirect_to workshop_path(@workshop), alert: "#{error.message}"
  end

  def booking_details
    @booking = Booking.find(params[:id])
  end

  # def send_message
  #   client = Twilio::REST::Client.new
  #   client.messages.create({
  #                            from: ENV['TWILIO_PHONE_NUMBER'],
  #                            to: '917991168428',
  #                            body: 'Hello there! This is a test'
  #                          })
  # end

  private

  def customer_params
    # params.require(:customer).permit(:full_name, :contact_number, :email)
    params.permit(:full_name, :contact_number, :email)
  end

  def card_token_params
    # params.require(:conversation).permit(:card_number, :exp_year, :exp_month, :cvv)
    params.permit(:card_number, :exp_year, :exp_month, :cvv)
  end
end
