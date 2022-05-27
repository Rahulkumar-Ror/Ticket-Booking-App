class WorkshopsController < ApplicationController
  before_action :authenticate_view!
  before_action :auth_admin, only: [:new, :create]
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

  def new
    @workshop = Workshop.new
    # @workshop.view_id = current_view.id
    # binding.pry
  end

  def create
    # binding.pry
    @workshop = Workshop.new(workshop_params)
    # @workshop.view_id = current_view.admin_id
    # binding.pry
    if @workshop.save
      # UserMailer.with(workshop: @user).welcome_email.deliver_later
      flash[:notice] = "Course successfully created"
      redirect_to workshops_path
    else
      flash[:alert] = "something wrong happend"
      render :new, status: :unprocessable_entity
    end
  end

  # def search_form
  #   @q = Workshop.ransack(params[:name])
  #   @Workshop = @q.result(distinct: true)
  # end

  def show
    @workshop = Workshop.friendly.find(params[:id])
  end

  private 
  def workshop_params
    params.require(:user).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :total_sits, :remaining_sits, :registration_fee, :clip, :thumbnail)
  end
  
end
