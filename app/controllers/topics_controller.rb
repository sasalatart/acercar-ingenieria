class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :toggle_status, :destroy]
  before_action :log_impression, only: [:show]

  TO_DISPLAY = 10

  def index
    all_topics = Topic.all.includes([:user, :tags])

    @most_seen = all_topics.unarchived.sort_by(&:views).reverse[0, 10]
    @most_commented = all_topics.unarchived.sort_by { |topic| topic.comments.size }.reverse[0, 10]

    @filtered = !!(params[:topic] && params[:topic][:tag_ids])
    if @filtered
      @tags = params[:topic][:tag_ids].to_a
      @topics = all_topics.unarchived.tagged_with(@tags)[0, TO_DISPLAY]
    else
      @topics = all_topics.unarchived[0, TO_DISPLAY]
    end

    gon.push(filtered: @filtered,
             offset: TO_DISPLAY,
             tag_ids: (@tags ? @tags : []),
             more_url: more_topics_path)
  end

  def more_topics
    offset = params[:resource][:offset].to_i
    if params[:resource][:filtered] == 'true'
      @topics = Topic.unarchived.tagged_with(params[:resource][:tag_ids])[offset, TO_DISPLAY]
    else
      @topics = Topic.unarchived[offset, TO_DISPLAY]
    end
  end

  def index_archived
    @topics = Topic.includes([:user, :tags]).archived.reverse
  end

  def mine
    @topics = Topic.includes([:user, :tags]).where(user: current_user)
  end

  def show
    @commentable = @topic

    @comments = @topic.comments
                      .includes([:user, :commentable])
                      .order('id DESC')
                      .paginate(page: params[:page], per_page: 10)

    current_user.mark_as_read @topic

    respond_to do |format|
      format.html
      format.js { render 'comments/change_page.js.erb', locals: { target: 'comment_topic' } }
    end
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    @topic.add_tags(params[:topic][:tag_ids])

    if @topic.save
      redirect_to topics_path, notice: 'Se ha creado el nuevo tema.'
    else
      flash.now[:danger] = @topic.human_errors
      render action: 'new'
    end
  end

  def edit
  end

  def update
    Tagging.where(taggable_type: @topic.class.name, taggable_id: @topic.id).delete_all

    if @topic.update_attributes(topic_params)
      @topic.add_tags(params[:topic][:tag_ids])
      redirect_to @topic, notice: 'Tema editado con exito.'
    else
      flash.now[:danger] = GENERIC_ERROR_MESSAGE
      render action: 'edit'
    end
  end

  def toggle_status
    if @topic.user == current_user || current_user.admin?
      flash[:success] = @topic.toggle_archived_status
    else
      flash[:danger] = NEED_PRIVILEGES_MESSAGE
    end

    redirect_to :back
  end

  def destroy
    if (@topic.user == current_user || current_user.admin?) && @topic.destroy
      flash[:success] = 'Tema eliminado exitosamente.'
    else
      flash[:danger] = NEED_PRIVILEGES_MESSAGE
    end

    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic)
          .permit(:title,
                  :description,
                  :tag_ids,
                  :user_admin_rank)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def log_impression
    return if @topic.impressions.any? { |i| i.user_id == current_user.id }

    @topic.impressions.create(ip_address: request.remote_ip, user_id: current_user.id)
  end
end
