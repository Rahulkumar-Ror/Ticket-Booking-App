class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_render_cart
  before_action :initialize_cart
  before_action :set_breadcrumbs
  before_action :set_time_zone, if: :view_signed_in?
  before_action :set_notifications, if: :current_view
  
  def add_breadcrumb(label, path, current = false)
    @breadcrumbs << {
      label: label,
      path: path,
      current: current
    }    
  end
  
  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :full_name, :contact_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :full_name, :contact_number])
  end

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart 
    @cart ||= Cart.find_by(id: session[:cart_id])
    
    if @cart.nil?
      @cart = Cart.create 
      session[:cart_id] = @cart.id
    end
  end

  private

  def set_notifications
    notifications = Notification.where(recipient: current_view).newest_first.limit(9).unread
    @unread = notifications.unread
    @read = notifications.read
  end

  def set_time_zone
    # Time.zone = current_view.time_zone.now
  end

  def set_breadcrumbs 
    @breadcrumbs = []
  end

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
