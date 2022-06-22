class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :full_name, :contact_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :full_name, :contact_number])
  end

  private

  def auth_admin
    if view_signed_in? && current_view.role == "Customer"
      flash[:notice] = "Only Admin can edit or add Course"
      redirect_to root_path
    end
  end

  def delete_admin
    if view_signed_in? && current_view.role == "Customer"
      flash[:notice] = "Only Admin can delete the course"
      redirect_to workshops_path
    end
  end

  def initialize_session
    session[:cart] ||= [] # empty cart = empty array
  end

  def load_cart
    @cart = Workshop.all
    # @cart = Workshop.where(session[:cart])
  end 
end
