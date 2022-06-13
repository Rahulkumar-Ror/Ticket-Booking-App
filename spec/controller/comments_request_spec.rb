require 'rails_helper'
RSpec.describe Comment, type: :request do
	
	# before do
	# 	@workshop = Workshop.create(:workshop)
	# 	@workshop.after_save 
	# end

	before do
		Comment.create(
			name: "On course",
			body: "This is very imporatant courses"
			)
	end

	it "get create new comment" do
		get new_workshop_comment_path(:workshop_id)
		expect(response).to be_successful
  end

end
