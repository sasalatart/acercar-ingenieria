class VirtualRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_virtual_room, only: [:show, :edit, :update, :toggle_status, :destroy]
  before_action :set_distinguished_section, only: [:create, :update]

  TO_DISPLAY = 10

  def index
    all_virtual_rooms = VirtualRoom.all.includes([:user, :tags, :taggings])
    @soon = all_virtual_rooms.soonest[0, 10]

    @filtered = !!(params[:virtual_room] && params[:virtual_room][:tag_ids])
    if @filtered
      @tags = params[:virtual_room][:tag_ids].to_a
      @virtual_rooms = all_virtual_rooms.unarchived.tagged_with(@tags)[0, TO_DISPLAY]
    else
      @virtual_rooms = all_virtual_rooms.unarchived[0, TO_DISPLAY]
    end

    gon.push(filtered: @filtered,
             offset: TO_DISPLAY,
             tag_ids: (@tags ? @tags : []),
             more_url: more_virtual_rooms_path)
  end

  def more_virtual_rooms
    offset = params[:resource][:offset].to_i
    if params[:resource][:filtered] == 'true'
      @virtual_rooms = VirtualRoom.unarchived.tagged_with(params[:resource][:tag_ids])[offset, TO_DISPLAY]
    else
      @virtual_rooms = VirtualRoom.unarchived[offset, TO_DISPLAY]
    end
  end

  def index_archived
    @virtual_rooms = VirtualRoom.archived.reverse
  end

  def mine
    @virtual_rooms = VirtualRoom.where(user: current_user)
  end

  def show
    @commentable = @virtual_room

    @comments = @virtual_room.comments
                             .order('id DESC')
                             .paginate(page: params[:page], per_page: 10)

    current_user.mark_as_read @virtual_room

    respond_to do |format|
      format.html
      format.js { render 'comments/change_page.js.erb', locals: { target: 'comment_virtual_room' } }
    end
  end

  def new
    @virtual_room = VirtualRoom.new

    @distinguished_sections = current_user.admin? ? DistinguishedSection.all : current_user.distinguished_sections
  end

  def create
    @virtual_room = VirtualRoom.new(virtual_room_params)
    @virtual_room.user = current_user

    if @virtual_room.save
      current_user.enroll(@virtual_room.id, @virtual_room.class.name).save
      @section.add_virtual_room(current_user, @virtual_room) if @section
      redirect_to virtual_rooms_path, notice: 'Se ha creado la sala virtual.'
    else
      flash.now[:danger] = GENERIC_ERROR_MESSAGE
      render action: 'new'
    end
  end

  def edit
    @distinguished_sections = current_user.admin? ? DistinguishedSection.all : current_user.distinguished_sections
  end

  def update
    Tagging.where(taggable_type: @virtual_room.class.name, taggable_id: @virtual_room.id).delete_all

    if @virtual_room.update_attributes(virtual_room_params)
      @section.add_virtual_room(current_user, @virtual_room) if @section

      redirect_to virtual_room_path(@virtual_room), notice: 'Sala actualizada exitosamente.'
    else
      flash.now[:danger] = GENERIC_ERROR_MESSAGE
      render action: 'edit'
    end
  end

  def toggle_status
    if @virtual_room.user == current_user || current_user.admin?
      flash[:success] = @virtual_room.toggle_archived_status
    else
      flash[:danger] = NEED_PRIVILEGES_MESSAGE
    end

    redirect_to :back
  end

  def destroy
    if (@virtual_room.user == current_user || current_user.admin?) && @virtual_room.destroy
      flash[:success] = 'Sala eliminada exitosamente.'
    else
      flash[:danger] = NEED_PRIVILEGES_MESSAGE
    end

    redirect_to virtual_rooms_path
  end

  private

  def virtual_room_params
    params.require(:virtual_room)
          .permit(:title,
                  :date,
                  :description,
                  :tag_ids,
                  :link)
  end

  def set_virtual_room
    @virtual_room = VirtualRoom.find_by(id: params[:id])
  end

  def set_distinguished_section
    @distinguished_section = DistinguishedSection.find(params[:virtual_room][:distinguished_section_id])
  end
end
