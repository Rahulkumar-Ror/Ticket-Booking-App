class WorkshopsController < ApplicationController
  # before_action :authenticate_view!
  # before_action :auth_admin, only: [:new, :create]
  before_action :initialize_session

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to workshops_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to workshops_path
  end

  def index
    @q = Workshop.ransack(params[:q])
    @course1s = @q.result(distinct: true)
 
    @workshops = Workshop.all
    # @workshops = Workshop.upcoming_workshops
    # @q = Workshop.ransack(params[:name])
    # @workshops = @q.result(distinct: true)
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

  def edit
    @workshop = Workshop.friendly.find(params[:id])
    # @workshop.view_id = current_view.id
    # binding.pry
  end

  def create
    # binding.pry
    @workshop = Workshop.new(workshop_params)
 
    if @workshop.save
      TestRunJob.perform_later("Hi")
      # UserMailer.with(workshop: @user).welcome_email.deliver_later
      flash[:notice] = "Course successfully created"
      redirect_to workshops_path
    else
      flash[:alert] = "something wrong happend"
      render :new, status: :unprocessable_entity
    end
  end

  def add_to_cart
    session[:cart] << params[:id]
    redirect_to root_path
  end

  # def search_form
  #   @q = Workshop.ransack(params[:name])
  #   @Workshop = @q.result(distinct: true)
  # end

  def show
    @workshop = Workshop.friendly.find(params[:id])
    session[:visit_count] ||= 0
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

  private 
  def workshop_params
    params.require(:workshop).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :total_sits, :remaining_sits, :registration_fee)
  end

  def initialize_session
    session[:cart] ||= []
  end
  
end
