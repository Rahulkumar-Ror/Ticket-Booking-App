class Orderable < ApplicationRecord
  belongs_to :workshop
  belongs_to :cart
  
  def total
    workshop.registration_fee * quantity
  end
end
