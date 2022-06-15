require 'rails_helper'
RSpec.describe Workshop, type: :request do
	
	before do
		# binding.pry
		@view = FactoryBot.create(:view)

		view_session_path @view
		@workshop = Workshop.create!(name: "Angular JS course",
			description: "Courses for Angular js developer from simform solution",
			start_date: Date.today + 4.days, 
			end_date: Date.today + 39.days,
			start_time: "10:00 AM", 
			end_time: "3:00 PM",
			total_sits: 100,
			remaining_sits:  70,
			registration_fee: 1500,
		  view_id: @view.id
		)
	end

	it "get all workshop" do
		get workshops_path
		expect(response).to be_successful
  end
	# it "get a particular workshop" do
  #   get workshop_path(@workshop.id)
	# 	expect(response).to be_successful
	# end
	 
	it "Make a new workshop" do
    get new_workshop_path
		expect(response).to be_successful
	end
  
	it "Should get create" do
		expect do
		post workshops_path, params: { workshop: 
			{ name: "Angular JS course",
			description: "Courses for Angular js developer from simform solution",
			start_date: Date.today + 4.days, 
			end_date: Date.today + 39.days,
			start_time: "10:00 AM", 
			end_time: "3:00 PM",
			total_sits: 100,
			remaining_sits:  70,
			registration_fee: 1500,
		  view_id: @view.id } 
		}
		  end.to change(Workshop, :count).by(1)
      expect(response).to have_http_status(:redirect)
  end

	it "show a particular workshop" do
    get workshop_path(@workshop.id)
		expect(response).to be_successful
	end
	
end
