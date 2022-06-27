class Refund < ApplicationRecord
  belongs_to :customer
  belongs_to :booking

  def amount_to_be_refunded
    no_of_tickets * booking.workshop.registration_fee
  end
end
