require 'rails_helper'

RSpec.describe Workshop, type: :model do
	subject {
    described_class.new(name: "Angular JS course",
			description: "Courses for Angular js developer from simform solution",
			start_date: Date.today + 4.days, 
			end_date: Date.today + 39.days,
			start_time: "10:00 AM", 
			end_time: "3:00 PM",
			total_sits: 100,
			remaining_sits:  70,
			registration_fee: 1500,
		  view_id: @view.id)
  }

	it " is valid with valid attributes" do
		workshop = Workshop.create(name: nil)
		expect(Workshop.new).to_not be_valid 
	end

	it " is valid with valid attributes" do
		workshop = Workshop.create(description: nil)
		expect(Workshop.new).to_not be_valid 
	end

	it " is valid with valid attributes" do
		workshop = Workshop.create(start_date: nil)
		expect(Workshop.new).to_not be_valid 
	end

	it " is valid with valid attributes" do
		workshop = Workshop.create(end_date: nil)
		expect(Workshop.new).to_not be_valid 
	end

	it " is valid with valid attributes" do
		workshop = Workshop.create(start_time: nil)
		expect(Workshop.new).to_not be_valid 
	end

	it " is valid with valid attributes" do
		workshop = Workshop.create(end_time: nil)
		expect(Workshop.new).to_not be_valid 
	end

	
end
