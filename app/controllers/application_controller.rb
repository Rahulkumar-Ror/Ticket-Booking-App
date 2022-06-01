class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_session
  before_action :load_cart

  private

  def initialize_session
    session[:cart] ||= [] # empty cart = empty array
  end
  
  def load_cart
    # @workshop = Workshop.all
    @cart = Workshop.all
    # binding.pry
    # @cart = Workshop.find(session[:cart])
    
  end

	protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

  private
    def auth_admin
      if view_signed_in? && current_view.role == "Customer"
				flash[:notice] = "Only admin can create a Courses"
				redirect_to root_path
	   	end
  	end
    
end
