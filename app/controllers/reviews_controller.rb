class ReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 
  ActionController::Parameters.permit_all_parameters = true
  # GET /reviews
  def index
    # byebug
    reviews = Review.all
    render json: reviews
  end

  # GET /reviews/1
  def show
    byebug
    review = Review.find(params[:id])
    render json: review
  end

  # POST /reviews
  def create
    # byebug
    review = Review.create!(params[:review])
    # byebug
    render json: review, status: :created
  end

  # PATCH/PUT /reviews/1
  def update
     review = Review.find(params[:id])
    if review.update(review_params)
      render json: review
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    review = Review.find_by(id: params[:id])
    review.destroy
  end

  private
    
    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:comment, :rating, :photo_id, :group_user_id)
    end
end
