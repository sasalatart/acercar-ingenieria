class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: [:edit, :update, :destroy]
  before_action :authorize_admin

  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_path, notice: 'El tag se ha creado exitosamente.'
    else
      redirect_to tags_path, alert: GENERIC_ERROR_MESSAGE
    end
  end

  def edit
  end

  def update
    if @tag.update_attributes(tag_params)
      redirect_to tags_path, notice: 'El tag se ha actualizado exitosamente.'
    else
      redirect_to tags_path, alert: GENERIC_ERROR_MESSAGE
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path, notice: 'El tag se ha eliminado exitosamente.'
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :category)
  end
end
