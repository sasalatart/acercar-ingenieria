class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_user_from_email, only: [:create_admin, :create_major_admin, :create_admin_distinguished_section]

  def index
    @admins = User.admins
    @major_admins = MajorAdmin.includes([:major, :user]).all
    @distinguished_section_admins = DistinguishedSectionAdmin.includes([:distinguished_section, :user]).all
  end

  def create_admin
    if @user && @user.admin?
      flash[:danger] = "#{@user.complete_name} ya era un administrador."
    elsif @user && !@user.admin?
      flash[:success] = "#{@user.complete_name} ahora es un administrador."
      @user.update(admin: true)
    else
      flash[:danger] = 'El usuario que buscas no existe.'
    end

    redirect_to :back
  end

  def delete_admin
    user = User.find(params[:user_id])

    if user.admin? && user.update(admin: false)
      flash[:success] = "#{user.complete_name} ha dejado de ser administrador."
    else
      flash[:danger] = "#{user.complete_name} no era un administrador."
    end

    redirect_to :back
  end

  def create_major_admin
    major_admin = MajorAdmin.new(user_id: @user.id, major_id: params[:major_id])

    if major_admin.save
      flash[:success] = 'Administrador de Major creado.'
    else
      flash[:danger] = major_admin.human_errors
    end

    redirect_to :back
  end

  def delete_major_admin
    major_admin = MajorAdmin.find_by(user_id: params[:user_id],
                                     major_id: params[:major_id])

    if major_admin && major_admin.destroy
      flash[:success] = 'Administrador de Major destituído.'
    else
      flash[:danger] = 'El par administrador/major no existe.'
    end

    redirect_to :back
  end

  def create_admin_distinguished_section
    distinguished_section_admin = DistinguishedSectionAdmin.new(user_id: @user.id,
                                                                distinguished_section_id: params[:distinguished_section_id])

    if distinguished_section_admin.save
      flash[:success] = 'Administrador de Sección Destacada creado.'
    else
      flash[:danger] = distinguished_section_admin.human_errors
    end

    redirect_to :back
  end

  def delete_admin_distinguished_section
    distinguished_section_admin = DistinguishedSectionAdmin.find_by(user_id: params[:user_id],
                                                                    distinguished_section_id: params[:distinguished_section_id])

    if distinguished_section_admin && distinguished_section_admin.destroy
      flash[:success] = 'Administrador de Sección Destacada destituído.'
    else
      flash[:danger] = 'El par administrador/sección no existe.'
    end

    redirect_to :back
  end

  private

  def set_user_from_email
    @user = User.find_by(email: params[:email])

    redirect_to admins_path, alert: 'Usuario no encontrado' unless @user
  end
end
