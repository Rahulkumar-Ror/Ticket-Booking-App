puts "Dummy course is on process"
workshop = Workshop.create([
	{
		name: "Ruby on rails course",
		description: "Courses for Ruby on rails developer from simform solution",
		start_date: Date.today + 4.days, 
		end_date: Date.today + 9.days,
		start_time: "10:00 AM", 
		end_time: "3:00 PM",
		total_sits: 100,
		remaining_sits: 90,
		registration_fee: 1500
	},
	{
		name: "DBMS  course",
		description: "Courses for Database developer from simform solution",
		start_date: Date.today + 12.days, 
		end_date: Date.today + 49.days,
		start_time: "10:00 AM", 
		end_time: "3:00 PM",
		total_sits: 60,
		remaining_sits: 100,
		registration_fee: 1500
	},
	{
		name: "Java course",
		description: "Courses for Java developer from simform solution",
		start_date: Date.today - 4.days, 
		end_date: Date.today + 9.days,
		start_time: "10:00 AM", 
		end_time: "3:00 PM",
		total_sits: 100,
		remaining_sits: 100,
		registration_fee: 1500
	},
	{
		name: "Dot net course",
		description: "Courses for Dot net developer from simform solution",
		start_date: Date.today - 14.days, 
		end_date: Date.today - 9.days,
		start_time: "10:00 AM", 
		end_time: "3:00 PM",
		total_sits: 100,
		remaining_sits: 100,
		registration_fee: 1500
	},
	{
		name: "Django course",
		description: "Courses for Django developer from simform solution",
		start_date: Date.today - 24.days, 
		end_date: Date.today - 19.days,
		start_time: "10:00 AM", 
		end_time: "3:00 PM",
		total_sits: 100,
		remaining_sits: 100,
		registration_fee: 1500
	},
	{
		name: "Spring JS course",
		description: "Courses for Spring JS developer from simform solution",
		start_date: Date.today + 14.days, 
		end_date: Date.today - 89.days,
		start_time: "10:00 AM", 
		end_time: "3:00 PM",
		total_sits: 100,
		remaining_sits: 100,
		registration_fee: 2500
	},
	{
		name: "React JS course",
		description: "Courses for React js developer from simform solution",
		start_date: Date.today + 4.days, 
		end_date: Date.today + 39.days,
		start_time: "10:00 AM", 
		end_time: "3:00 PM",
		total_sits: 100,
		remaining_sits: 50,
		registration_fee: 1500
	},
	{
		name: "Mathematics course",
		description: "Courses for Mathematical from simform solution",
		start_date: Date.today - 54.days, 
		end_date: Date.today - 39.days,
		start_time: "10:00 AM", 
		end_time: "3:00 PM",
		total_sits: 100,
		remaining_sits: 50,
		registration_fee: 1500
	},
	{
		name: "Amazon web service JS course",
		description: "Courses for Cloud developer from simform solution",
		start_date: Date.today + 14.days, 
		end_date: Date.today + 39.days,
		start_time: "10:00 AM", 
		end_time: "3:00 PM",
		total_sits: 100,
		remaining_sits: 95,
		registration_fee: 1500
	},
	{
		name: "Django python course",
		description: "Courses for Django python backend developer from simform solution",
		start_date: Date.today + 4.days, 
		end_date: Date.today + 39.days,
		start_time: "10:00 AM", 
		end_time: "3:00 PM",
		total_sits: 100,
		remaining_sits: 100,
		registration_fee: 1500
	},
	{
		name: "Vue JS course",
		description: "Courses for React js developer from simform solution",
		start_date: Date.today + 4.days, 
		end_date: Date.today + 39.days,
		start_time: "10:00 AM", 
		end_time: "3:00 PM",
		total_sits: 100,
		remaining_sits: 85,
		registration_fee: 1500
	},
	{
		name: "Angular JS course",
		description: "Courses for Angular js developer from simform solution",
		start_date: Date.today + 4.days, 
		end_date: Date.today + 39.days,
		start_time: "10:00 AM", 
		end_time: "3:00 PM",
		total_sits: 100,
		remaining_sits:  70,
		registration_fee: 1500
	}
	])
puts "Dummy course is Created successfully"
