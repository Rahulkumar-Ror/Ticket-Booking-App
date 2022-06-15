class TestRunJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "----------------------------------------"
  end
end
