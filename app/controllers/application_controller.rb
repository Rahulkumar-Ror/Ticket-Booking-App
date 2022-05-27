class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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
