class SessionsController < ApplicationController
  ActionController::Parameters.permit_all_parameters = true

  # GET user
  def index
    user = User.all
    render json: user
  end

  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

    def create
        user = User.find_by(name: params[:name])
        if !user
          render json: {error: "no user found"}
        else
          session[:user_id] = user.id
          render json: user
        end
     end

     def destroy
        session.delete :user_id
        head :no_content
     end
  
     private
    
     def login_params 
      params.require(:user).params.permit(:user_name, :email, :dateObird)
     end
end