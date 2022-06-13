class Booking < ApplicationRecord
  has_many :refunds, dependent: :destroy
  belongs_to :customer
  belongs_to :workshop
  
  validates :order_number, presence: true, uniqueness: true

  before_validation :generate_order_number
  after_create :update_workshop_sit_count

  def update_workshop_sit_count
    workshop.update(remaining_sits: workshop.total_sits - no_of_tickets)
  end

  def generate_order_number
    self.order_number = "BOOKING-#{SecureRandom.hex(5).upcase}"
  end

  def is_refundable?
    workshop.start_date > Date.today
  end
end
