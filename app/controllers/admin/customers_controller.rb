class Admin::CustomersController < AdminController
  before_action  :set_customer, only: %i[show destroy]

	def index
		@q = Customer.ransack(params[:q])
		@customers = @q.result
		# binding.pry
		if params[:q]
			# binding.pry
      @results = GoogleCustomSearchApi.search(params[:q])
	  end
	end
  

  def show
	end 
	
	private
  def set_customer
    @customer = Customer.find(params[:id])
	end
end
