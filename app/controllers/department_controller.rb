class DepartmentController < ApplicationController
    # skip_before_action :authenticate_request, only: [:create, login]
  before_action :set_department, only: [:show, :update, :destroy]

  # GET /departments
  def index
    @departments = Department.all

    render json: @departments.map { |department| department.new_attributes }
  end

# GET /departments/1
def show
  render json: @department.new_attributes
end

# POST /departments
def create
  @department = Department.new(department_params)

  if @department.save
    render json: @department.new_attributes, status: :created, location: @department
  else
    render json: @department.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /departments/1
def update
  if @department.update(department_params)
    render json: @department.new_attributes
  else
    render json: @department.errors, status: :unprocessable_entity
  end
end

# DELETE /departments/1
def destroy
  @department.destroy
end

private
  # Use callbacks to share common setup or constraints between actions.
def set_department
  @department = Department.find_by_id(params[:id])
  if @department.nil?
    render json: { error: "department not found" }, status: :not_found
  end
end

def department_params
  {
    name: params[:name],
    # password: params[:password],
    # email: params[:email],
    # first_name: params[:first_name],
    # last_name: params[:last_name],
    # bio: params[:bio],
  }
end
end
