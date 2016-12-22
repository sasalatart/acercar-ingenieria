class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_major, only: [:index, :new, :create]
  before_action :authorize_sub_admin, except: [:index, :show]

  def index
    @articles = @major ? @major.articles : Article.all

    @articles = @articles.includes([:major, :categories])
                         .order('id DESC')
                         .paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @commentable = @article
    @comments = @article.comments.order('id DESC').paginate(page: params[:page], per_page: 10)

    current_user.mark_as_read @article if user_signed_in?

    respond_to do |format|
      format.js { render 'comments/change_page.js.erb', locals: { target: 'comment_article' } }
      format.html { redirect_to [@article.major, @article] if @article.major && !params[:major_id] }
    end
  end

  def new
    @article = @major ? @major.articles.build : Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.major = @major
    @article.add_categories(params[:article][:category_ids])
    @article.add_documents(params[:documents])

    if @article.save
      redirect_to root_path, notice: 'Se creó el artículo exitosamente.'
    else
      @article.attachments.delete_all
      flash.now[:danger] = @article.human_errors
      render action: 'new'
    end
  end

  def edit
  end

  def update
    @article.add_categories(params[:article][:category_ids])
    @article.add_documents(params[:documents])

    if @article.update(article_params)
      flash[:success] = 'Se actualizó el artículo exitosamente.'
      redirect_to @article.major ? major_articles_path(@article.major) : @article
    else
      render action: 'edit', alert: GENERIC_ERROR_MESSAGE
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, notice: 'Se destruyó el artículo exitosamente.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    if params[:major_id]
      major = Major.find(params[:major_id])
      @article = major.articles.find(params[:id])
    else
      @article = Article.find(params[:id])
    end
  end

  def set_major
    @major = Major.find(params[:major_id]) if params[:major_id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :content, :short_description, :image)
  end
end
