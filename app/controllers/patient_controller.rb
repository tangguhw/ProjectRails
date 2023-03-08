class PatientController < ApplicationController
    before_action :set_patient, only: [:show, :update, :destroy]

    # GET /users
    def index
      @patients = Patient.all
  
      render json: @patients.map { |patient| patient.new_attributes }
    end
  
  # GET /patients/1
  def show
    render json: @patient.new_attributes
  end
  
  # POST /patients
  def create
    @patient = Patient.new(patient_params)
  
    if @patient.save
      render json: @patient.new_attributes, status: :created, location: @patient
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /patients/1
  def update
    if @patient.update(patient_params)
      render json: @patient.new_attributes
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /patients/1
  def destroy
    @patient.destroy
  end
  
  # def login
  #   @patient = Patient.find_by(patientname: params[:patientname])
  #   if @patient && @patient&.authenticate(params[:password])
  #     token = JsonWebToken.encode(patient_id: @patient.id)
  #     render json: {
  #       patient: @patient.new_attributes,
  #       token: token,
  #     }
  #   else
  #     render json: { error: "Invalid patientname or password" }, status: :unauthorized
  #   end
  # end
  
  private
    # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find_by_id(params[:id])
    if @patient.nil?
      render json: { error: "patient not found" }, status: :not_found
    end
  end
  
  def patient_params
    {
      name: params[:name],
      address: params[:address],
      dob: params[:dob],
      gender: params[:gender],
      contact: params[:contact],
    #   password: params[:password],
    #   email: params[:email],
      # first_name: params[:first_name],
      # last_name: params[:last_name],
      # bio: params[:bio],
    }
  end
end
