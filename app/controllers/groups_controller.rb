class GroupsController < ApplicationController
  ActionController::Parameters.permit_all_parameters = true
  

  # GET /groups
  def index
    groups = Group.all
    render json: groups
  end

  # GET /groups/1
  def show
    # byebug
    group = Group.find(params[:id])
    render json: user
  end

  # POST /groups
  def create
  #  byebug
    group = Group.create!(params[:group])
    render json: group, status: :created
  end

  # PATCH/PUT /groups/1
  def update
    if group.update(group_params)
      render json: group
    else
      render json: group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  def destroy
    group = Group.find_by(id: params[:id])
    group.destroy
  end

  private
    
    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :type, :user_id)
    end
end
