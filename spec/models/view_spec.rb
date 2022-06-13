require "rails_helper"

RSpec.describe View, type: :model do
  it "should create View login " do
    @view = View.new
    @view.email = "admin@gmail.com"
    @view.password = "123456"
    @view.save
    expect(@view).to be_valid
  end

  it "should have email " do
    @view = View.new
    @view.password = "123456"
    @view.save
    expect(@view).to_not be_valid
  end

  it "should have password " do
    @view = View.new
    @view.email = "admin@gmail.com"
    @view.save
    expect(@view).to_not be_valid
  end

  it "factory bot" do
    view = FactoryBot.create(:view)
    expect(view).to be_valid
  end
end
