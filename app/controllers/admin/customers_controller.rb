class Admin::CustomersController < AdminController
  before_action  :set_customer, only: %i[show destroy]
  before_action :set_index, only: %i[index]
	def index
    add_breadcrumb('User list', false)
		@q = Customer.ransack(params[:q])
		@customers = @q.result
	end
  

  def show
	end 
	
	private
  def set_customer
    @customer = Customer.find(params[:id])
	end

	def set_index
    add_breadcrumb('Admin dashboard', admin_dashboard_path , false)
	end
end
