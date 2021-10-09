class SessionsController < ApplicationController
    def create
        # byebug
        user = User.find_by(name: params[:name])
        if !user
          render json: {error: "no user found"}
        else
          session[:user_id] = user.id
          render json: user
        end
     end

     def destroy
      # byebug
        session.delete :user_id
        head :no_content
     end
  
     private
    
     def login_params 
        params.permit(:user_name)
     end
end