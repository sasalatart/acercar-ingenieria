class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :destroy]
  before_action :authorize_admin, except: [:unenroll]

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Usuario eliminado.'
  end

  def unenroll
    status = current_user.unenroll(params[:enrollable_id], params[:enrollable_type]) ? 200 : 400
    render nothing: true, status: status, content_type: :script
  end

  def import
    if params[:file]
      User.import(params[:file])
      redirect_to users_path, notice: 'Usuarios importados.'
    else
      redirect_to users_path, notice: 'Necesita seleccionar un archivo.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
