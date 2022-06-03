class HomesController < ApplicationController
  # before_action :authenticate_view!
  def index
    @upcoming_workshops = Workshop.upcoming_workshops
    @past_workshops = Workshop.past_workshops
  end
end
