class TestRunJob < ApplicationJob
  queue_as :default

  def perform
    puts "Test Run job is performed"
  end
end
