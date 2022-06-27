class RefundNotificationMailer < ApplicationMailer

  def customer_refund_notification(refund)
    @refund = refund
    @booking = refund.booking
    @customer = refund.customer
    @workshop = @booking.workshop
    @refundable_amount = @refund.no_of_tickets * @workshop.registration_fee
    mail to: @customer.email, subject: "Refund accepted for #{@workshop.name}"
  end

  def admin_refund_notification(refund)
    @refund = refund
    @booking = refund.booking
    @customer = refund.customer
    @workshop = @booking.workshop
    @refundable_amount = @refund.no_of_tickets * @workshop.registration_fee
    mail to: AdminView.first.email, subject: "Refund request coming for #{@workshop.name}"
  end
end
