class FaqsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_frequent_question, only: [:edit, :update, :destroy]
  before_action :authorize_admin, except: [:index, :new, :create]

  def index
    @frequent_questions = Faq.where(frequent: true)
    @other_questions = Faq.where(frequent: false)

    @other_answered = @other_questions.where.not(answer: nil).any?
    @other_not_answered = @other_questions.where(answer: nil).any?
  end

  def new
    @frequent_question = Faq.new
  end

  def create
    @frequent_question = Faq.new(frequent_question_params)

    if @frequent_question.save
      success_message = 'La pregunta fue exitosamente creada.'

      unless params[:frequent_question][:answer]
        success_message << ' Ahora deberás esperar a que sea respondida.'
      end

      redirect_to faqs_path, notice: success_message
    else
      flash.now[:danger] = GENERIC_ERROR_MESSAGE
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @frequent_question.update(frequent_question_params)
      redirect_to faqs_path, notice: 'La pregunta fue exitosamente actualizada.'
    else
      flash.now[:danger] = GENERIC_ERROR_MESSAGE
      render action: 'edit'
    end
  end

  def destroy
    @frequent_question.destroy

    redirect_to faqs_url, notice: 'Se destruyó la pregunta exitosamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_frequent_question
    @frequent_question = Faq.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def frequent_question_params
    if user_signed_in? && current_user.admin?
      params.require(:faq).permit(:question, :answer, :frequent)
    else
      params.require(:faq).permit(:question)
    end
  end
end
