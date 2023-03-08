class AppointmentController < ApplicationController
# skip_before_action :authenticate_request, only: [:create, login]
before_action :set_appointment, only: [:show, :update, :destroy]

# GET /appointments
def index
    @appointments = Appointment.all

    render json: @appointments.map { |appointment| appointment.new_attributes }
end
  
  # GET /appointments/1
  def show
    render json: @appointment.new_attributes
  end
  
  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
  
    if @appointment.save
      render json: @appointment.new_attributes, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment.new_attributes
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /appointments/1
  def destroy
    @appointment.destroy
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find_by_id(params[:id])
    if @appointment.nil?
      render json: { error: "appointment not found" }, status: :not_found
    end
  end
  
  def appointment_params
    {
      appointment_date: params[:appointment_date],
      doctor_id: params[:doctor_id],
      patient_id: params[:patient_id],
      schedule_id: params[:schedule_id]
    #   start: params[:start],
    #   end: params[:end]
      # password: params[:password],
      # email: params[:email],
      # first_name: params[:first_name],
      # last_name: params[:last_name],
      # bio: params[:bio],
    }
  end
end
