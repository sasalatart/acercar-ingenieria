class DistinguishedSectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_distinguished_section, only: [:edit, :update, :destroy]
  before_action :authorize_admin, except: [:request_section]

  def index
    @distinguished_sections = DistinguishedSection.all
    @distinguished_section = DistinguishedSection.new
  end

  def create
    @distinguished_section = DistinguishedSection.new(distinguished_section_params)

    if @distinguished_section.save
      flash[:success] = 'La sección destacada se ha creado exitosamente.'
    else
      flash[:danger] = GENERIC_ERROR_MESSAGE
    end

    redirect_to distinguished_sections_path
  end

  def edit
  end

  def update
    if @distinguished_section.update_attributes(distinguished_section_params)
      flash[:success] = 'La sección se ha actualizado exitosamente.'
    else
      flash[:danger] = GENERIC_ERROR_MESSAGE
    end

    redirect_to distinguished_sections_path
  end

  def destroy
    @distinguished_section.destroy

    redirect_to distinguished_sections_path, notice: 'La sección se ha eliminado exitosamente.'
  end

  def request_section
    name = params[:request_section][:name]
    description = params[:request_section][:description]
    reasons = params[:request_section][:reasons]

    if name && description && reasons
      flash[:success] = 'Se ha enviado tu solicitud por correo electrónico a los administradores.'
      UserMailer.request_distinguished_section(current_user.complete_name, name, description, reasons).deliver
    else
      flash[:danger] = 'Debes rellenar todos los campos para solicitar una sección.'
    end

    redirect_to :back
  end

  private

  def set_distinguished_section
    @distinguished_section = DistinguishedSection.find(params[:id])
  end

  def distinguished_section_params
    params.require(:distinguished_section).permit(:name, :description)
  end
end
