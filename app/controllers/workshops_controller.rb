class WorkshopsController < ApplicationController
  before_action :get_workshop, only: %i[ edit update destroy show]
  before_action :authenticate_view!, only: %i[ show new create edit update ]
  before_action :auth_admin, only: [:new, :create, :edit, :update]
  before_action :delete_admin, only: [:destroy]
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
  end

  def update
    @workshop.view_id = current_view.id
    @workshop.update(workshop_params)
    if @workshop.valid?
      redirect_to workshops_path
    else
      flash[:errors] = @workshop.errors.full_messages
      redirect_to edit_workshop_path
    end
  end

  def create 
    @workshop = Workshop.new(workshop_params)
    @workshop.view_id = current_view.id
   
    if @workshop.save
      TestRunJob.perform_later("Hi")
      flash[:notice] = "Course successfully created"
      redirect_to workshops_path
    else
      flash[:alert] = @workshop.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @workshop.destroy
    redirect_to workshop_path
  end 

  def profile
    @view = View.all
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
    session[:visit_count] ||= 0
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

  private 

  def get_workshop
    @workshop = Workshop.friendly.find(params[:id])
  # rescue ActiveRecord::RecordNotFound => error
  #   redirect_to workshops_path, notice: error.message
  end

  def workshop_params
    params.require(:workshop).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :total_sits, :remaining_sits, :registration_fee, :clip, :thumbnail)
  end

  def initialize_session
    session[:cart] ||= []
  end
  
end
