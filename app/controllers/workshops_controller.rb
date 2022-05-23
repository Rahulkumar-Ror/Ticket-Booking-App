class WorkshopsController < ApplicationController
  def index
    # @workshops = Workshop.upcoming_workshops
    @q = Workshop.ransack(params[:name])
    @workshops = @q.result(distinct: true)
    respond_to do |format|
      format.html
      format.csv {
        send_data ExportService::WorkshopExport.new(@q.result).to_csv, filename: "Workshop-#{DateTime.current}.csv"
      }
    end
  end

  # def search_form
  #   @q = Workshop.ransack(params[:name])
  #   @Workshop = @q.result(distinct: true)
  # end

  def show
    @workshop = Workshop.friendly.find(params[:id])
  end
end
