class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_admin_major_article, except: [:create]
  before_action :correct_user, only: [:edit, :update]

  def create
    # @commentable == @enrollable
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Comentario creado exitosamente.' }
        format.js
      else
        redirect_to :back, alert: GENERIC_ERROR_MESSAGE
      end
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.commentable, notice: 'Comentario actualizado exitosamente.'
    else
      render action: 'edit', alert: GENERIC_ERROR_MESSAGE
    end
  end

  def destroy
    if @comment.user == current_user || (user_signed_in? && current_user.admin?) || @sub_admin
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to :back, notice: 'Comentario eliminado exitosamente.' }
        format.js
      end
    else
      redirect_to :back, alert: NEED_PRIVILEGES_MESSAGE
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content, :title)
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return Regexp.last_match(1)
                     .classify
                     .constantize
                     .find(value)
      end
    end

    nil
  end

  def correct_user
    return if @comment.user == current_user

    redirect_to root_path, alert: NEED_PRIVILEGES_MESSAGE
  end
end
