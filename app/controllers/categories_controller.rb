class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authorize_sub_admin, except: [:show]

  def index
    @categories = Category.all
    @category = Category.new
  end

  def show
    @articles = @category.articles
                         .order('id DESC')
                         .paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_url, notice: 'Se creó la categoría exitosamente.'
    else
      flash.now[:danger] = GENERIC_ERROR_MESSAGE
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Se actualizó la categoría exitosamente.'
    else
      flash.now[:danger] = GENERIC_ERROR_MESSAGE
      render action: 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Se destruyó la categoría exitosamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name)
  end
end
