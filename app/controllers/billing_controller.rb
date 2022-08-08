class BillingController < ApplicationController
  before_action :authenticate_view!
  def show
    @portal_session = current_view.payment_processor.billing_portal
  end
end
