class MajorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_major, only: [:show, :edit, :update, :destroy, :mail]
  before_action :authorize_sub_admin, only: [:edit, :update, :mail]
  before_action :authorize_admin, only: [:new, :create, :destroy]

  def index
    @majors = Major.all
  end

  def show
    @commentable = @major
    @major_faqs = @major.faqs.includes(:major)

    @comments = @major.comments
                      .includes([:user, :commentable])
                      .order('id DESC')
                      .paginate(page: params[:page], per_page: 10)

    current_user.mark_as_read @major if user_signed_in?

    respond_to do |format|
      format.html
      format.js { render 'comments/change_page.js.erb', locals: { target: 'comment_major' } }
    end
  end

  def new
    @major = Major.new
  end

  def create
    @major = Major.new(major_params)

    if @major.save
      redirect_to @major, notice: 'Se creó el major exitosamente.'
    else
      flash.now[:danger] = GENERIC_ERROR_MESSAGE
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @major.update(major_params)
      redirect_to @major, notice: 'Se actualizó el major exitosamente.'
    else
      flash.now[:danger] = GENERIC_ERROR_MESSAGE
      render action: 'edit'
    end
  end

  def destroy
    @major.destroy
    redirect_to majors_url, notice: 'Se destruyó el major exitosamente.'
  end

  def send_email
    UserMailer.major_multiple(@major.users, params[:title], params[:content])
    redirect_to :back, notice: 'Correos enviados con éxito.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_major
    @major = Major.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def major_params
    params.require(:major)
          .permit(:name,
                  :description,
                  :short_description,
                  :video_url_code,
                  :logo,
                  :category)
  end

  def set_admin_major
    return unless user_signed_in?
    @sub_admin = MajorAdmin.where(major_id: params[:id], user_id: current_user.id).any?
  end
end
