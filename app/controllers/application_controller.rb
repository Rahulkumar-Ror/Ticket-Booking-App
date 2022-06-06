class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_cart

  private

  def initialize_session
    session[:cart] ||= [] # empty cart = empty array
  end

  def load_cart
    @cart = Workshop.all
    # @cart = Workshop.where(session[:cart])
  end 
end
