class UsersController < ApplicationController
  def index
    @views = View.all
    # binding.pry
    
  end
end
