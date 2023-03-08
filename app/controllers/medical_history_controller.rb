class MedicalHistoryController < ApplicationController
# skip_before_action :authenticate_request, only: [:create, login]
before_action :set_medical_history, only: [:show, :update, :destroy]

# GET /medical_historys
def index
    @medical_historys = MedicalHistory.all

    render json: @medical_historys.map { |medical_history| medical_history.new_attributes }
end
  
  # GET /medical_historys/1
  def show
    render json: @medical_history.new_attributes
  end
  
  # POST /medical_historys
  def create
    @medical_history = MedicalHistory.new(medical_history_params)
  
    if @medical_history.save
      render json: @medical_history.new_attributes, status: :created, location: @medical_history
    else
      render json: @medical_history.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /medical_historys/1
  def update
    if @medical_history.update(medical_history_params)
      render json: @medical_history.new_attributes
    else
      render json: @medical_history.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /medical_historys/1
  def destroy
    @medical_history.destroy
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
  def set_medical_history
    @medical_history = MedicalHistory.find_by_id(params[:id])
    if @medical_history.nil?
      render json: { error: "medical_history not found" }, status: :not_found
    end
  end
  
  def medical_history_params
    {
      complaint: params[:complaint],
      diagnosis: params[:diagnosis],
      prescription: params[:prescription],
      doctor_id: params[:doctor_id],
      patient_id: params[:patient_id],
    #   schedule_id: params[:schedule_id]
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
