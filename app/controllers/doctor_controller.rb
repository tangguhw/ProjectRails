class DoctorController < ApplicationController
  # skip_before_action :authenticate_request, only: [:create, login]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = Doctor.all

    render json: @users.map { |user| user.new_attributes }
  end

# GET /users/1
def show
  render json: @user.new_attributes
end

# POST /users
def create
  @user = Doctor.new(user_params)

  if @user.save
    render json: @user.new_attributes, status: :created, location: @user
  else
    render json: @user.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /users/1
def update
  if @user.update(user_params)
    render json: @user.new_attributes
  else
    render json: @user.errors, status: :unprocessable_entity
  end
end

# DELETE /users/1
def destroy
  @user.destroy
end

# def login
#   @user = Doctor.find_by(username: params[:username])
#   if @user && @user&.authenticate(params[:password])
#     token = JsonWebToken.encode(user_id: @user.id)
#     render json: {
#       user: @user.new_attributes,
#       token: token,
#     }
#   else
#     render json: { error: "Invalid username or password" }, status: :unauthorized
#   end
# end

private
  # Use callbacks to share common setup or constraints between actions.
def set_user
  @user = Doctor.find_by_id(params[:id])
  if @user.nil?
    render json: { error: "User not found" }, status: :not_found
  end
end

def user_params
  {
    name: params[:name],
    password: params[:password],
    email: params[:email],
    specialization: params[:specialization],
    contact: params[:contact],
    department_id: params[:department_id]
    # last_name: params[:last_name],
    # bio: params[:bio],
  }
end

end
