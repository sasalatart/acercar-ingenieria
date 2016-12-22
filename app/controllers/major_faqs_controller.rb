class MajorFaqsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_major, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_major_faq, only: [:edit, :update, :destroy]
  before_action :authorize_sub_admin

  def new
    @major_faq = @major.faqs.build
  end

  def create
    @major_faq = @major.faqs.create(faq_params)

    if @major_faq.save
      redirect_to @major_faq.major, notice: 'Se ha creado la pregunta frecuente exitosamente.'
    else
      flash.now[:danger] = GENERIC_ERROR_MESSAGE
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @major_faq.update(faq_params)
      redirect_to @major_faq.major, notice: 'Pregunta editada exitosamente.'
    else
      flash.now[:danger] = GENERIC_ERROR_MESSAGE
      render action: 'edit'
    end
  end

  def destroy
    @major_faq.destroy

    redirect_to @major, notice: 'Pregunta eliminada exitosamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_major_faq
    @major_faq = @major.faqs.find(params[:id])
  end

  def set_major
    @major = Major.find(params[:major_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def faq_params
    params.require(:major_faq).permit(:question, :answer)
  end
end
