FactoryBot.define do
  factory :workshop do
    name { "Ruby on rails" }
    description { "123456" }
    start_date { Date.today + 4.days }
    end_date { Date.today + 39.days }
    start_time { "10:00 AM" }
    end_time { "3:00 PM" }
    total_sits { 100 }
    remaining_sits { 100 }
    registration_fee { 1500 }
    view_id { FactoryBot.create(:view).id }
  end
end
