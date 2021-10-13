class PhotosController < ApplicationController
  before_action :authorize
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  ActionController::Parameters.permit_all_parameters = true
  

  # GET /photos
  def index
    photos = Photo.all
    render json: photos
  end

  # GET /photos/1
  def show
    photo = Photo.find(params[:id])
    render json: photo
  end

  # POST /photos
  def create
    photo = Photo.create!(params[:photo])
    if photo.valid?
       render json: photo, status: :created
      else
        render json: { error: photo.errors }, status: :unprocessable_entity
      end
    
  end

  # PATCH/PUT /photos/1
  def update
    if photo.update(photo_params)
      render json: photo
    else
      render json: photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  def destroy
    photo = Photo.find_by(id: params[:id])
    photo.destroy
  end

  private
  def authorize
    return render json: { error: " User Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

  def render_not_found_response
    render json: { error: "photos not found" }, status: :not_found
  end
     
    def set_photo
      photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.require(:photo).permit(:namePhoto, :url, :data,  :fileName, :mimeType, :user_id, :group_user_id)
    end
end
