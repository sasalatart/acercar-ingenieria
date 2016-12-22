class LandingPhotosController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_landing_photo, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, except: [:show]

  def index
    @landing_photos = LandingPhoto.all
  end

  def show
  end

  def new
    @landing_photo = LandingPhoto.new
  end

  def create
    @landing_photo = LandingPhoto.new(photo_params)

    if @landing_photo.save
      flash[:success] = 'El anuncio se ha creado exitosamente.'
    else
      flash[:danger] = GENERIC_ERROR_MESSAGE
    end

    redirect_to landing_photos_url
  end

  def edit
  end

  def update
    if @landing_photo.update(photo_params)
      flash[:success] = 'El anuncio se ha actualizado exitosamente.'
    else
      flash[:danger] = GENERIC_ERROR_MESSAGE
    end

    redirect_to landing_photos_url
  end

  def destroy
    @landing_photo.destroy
    redirect_to landing_photos_url, notice: 'Se destruyó el anuncio exitosamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_landing_photo
    @landing_photo = LandingPhoto.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def photo_params
    params[:landing_photo].permit(:image, :title, :text, :pinned)
  end
end
