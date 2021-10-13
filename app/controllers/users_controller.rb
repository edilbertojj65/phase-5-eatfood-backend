class UsersController < ApplicationController
  before_action :authorize
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /users
  def index
    users = User.all
    render json: users  
  end

  def groups_index
    user = User.find(params[:user_id])
    groups =  user.groups
    render json: groups , include: :user
  end

  def group
    group = Group.find(params[:id])
    render json: group, include: :users
  end

  # GET /users/1
  def show
    # byebug
    user = User.find(params[:id])
    render json: user
  end

  def showlogin
   # byebug
    user = User.find(session[:user_id])
    render json: user
  end

  # POST /users
  def create
    user = User.create!(params[:user])
    render json: user, status: :created
   end

  # PATCH/PUT /users/1
  def update
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
  end

  private

  def authorize
    return render json: { error: " User Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

  def render_not_found_response
    render json: { error: "User not found" }, status: :not_found
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :dateObird)
    end
end
