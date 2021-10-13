class ReviewsController < ApplicationController
  before_action :authorize
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 
  ActionController::Parameters.permit_all_parameters = true
  # GET /reviews
  def index
   #  byebug
    reviews = Review.all
    render json: reviews , include: :photo
  end

  # GET /reviews/1
  def show
    review = Review.find(params[:id])
    render json: review
  end

  # POST /reviews
  def create
    review = Review.create!(params[:review])
    render json: review, status: :created , include: :photo
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

  def authorize
    return render json: { error: " User Not authorized" }, status: :unauthorized unless session.include? :user_id
  end
  
    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:comment, :rating, :photo_id, :group_user_id)
    end
end
