class Event < ActiveRecord::Base
  has_one_attached :calendar
end
