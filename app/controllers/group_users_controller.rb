class GroupUsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  ActionController::Parameters.permit_all_parameters = true

  # GET /group_users
  def index
    group_users = GroupUser.all
    render json: group_users
  end

  # GET /group_users/1
  def show
    # byebug
    group_users = GroupUser.find(params[:id])
    render json: group_users
  end

  # POST /group_users
  def create
   # byebug
    group_users = GroupUser.create!(group_user_params)
     
    render json: group_users, status: :created
  end

  # PATCH/PUT /group_users/1
  def update
    if group_user.update(group_user_params)
      render json: group_user
    else
      render json: group_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /group_users/1
  def destroy
    group_user = GroupUser.find_by(id: params[:id])
    group_user.destroy
  end

  private
  def render_not_found_response
    render json: { error: "group users not found" }, status: :not_found
  end
   
    # Only allow a list of trusted parameters through.
    def group_user_params
      params.require(:group_user).permit(:name, :group_id)
    end
end
