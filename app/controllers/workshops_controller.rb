class WorkshopsController < ApplicationController
  def index
    # @workshops = Workshop.upcoming_workshops
    @q = Workshop.ransack(params[:name])
    @workshops = @q.result(distinct: true)
  end

  # def search_form
  #   @q = Workshop.ransack(params[:name])
  #   @Workshop = @q.result(distinct: true)
  # end

  def show
    @workshop = Workshop.friendly.find(params[:id])
  end
end
