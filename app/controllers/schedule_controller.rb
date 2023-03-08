class ScheduleController < ApplicationController
# skip_before_action :authenticate_request, only: [:create, login]
before_action :set_schedule, only: [:show, :update, :destroy]

# GET /schedules
def index
    @schedules = Schedule.all

    render json: @schedules.map { |schedule| schedule.new_attributes }
end
  
  # GET /schedules/1
  def show
    render json: @schedule.new_attributes
  end
  
  # POST /schedules
  def create
    @schedule = Schedule.new(schedule_params)
  
    if @schedule.save
      render json: @schedule.new_attributes, status: :created, location: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /schedules/1
  def update
    if @schedule.update(schedule_params)
      render json: @schedule.new_attributes
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /schedules/1
  def destroy
    @schedule.destroy
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
  def set_schedule
    @schedule = Schedule.find_by_id(params[:id])
    if @schedule.nil?
      render json: { error: "schedule not found" }, status: :not_found
    end
  end
  
  def schedule_params
    {
      doctor_id: params[:doctor_id],
      # day: params[:day],
      start: params[:start],
      end: params[:end]
      # password: params[:password],
      # email: params[:email],
      # first_name: params[:first_name],
      # last_name: params[:last_name],
      # bio: params[:bio],
    }
  end
end
