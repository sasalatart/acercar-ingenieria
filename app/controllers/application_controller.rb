class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: ->{ request.format.json? }

  GENERIC_ERROR_MESSAGE = 'Hubo un error con tu solicitud. Inténtalo nuevamente.'.freeze
  NEED_PRIVILEGES_MESSAGE = 'No tienes los permisos para realizar esto.'.freeze

  before_action :set_admin_major
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  def set_admin_major
    return unless user_signed_in? && params[:major_id]

    @sub_admin = MajorAdmin.where(major_id: params[:major_id],
                                  user_id: current_user.id).any?
  end

  def set_admin_major_article
    return unless user_signed_in? && params[:article_id]

    article = Article.find(params[:article_id])
    @sub_admin = MajorAdmin.where(major_id: article.major_id,
                                  user_id: current_user.id).any?
  end

  def authorize_admin
    return if user_signed_in? && current_user.admin?

    redirect_to root_path, alert: NEED_PRIVILEGES_MESSAGE
  end

  def authorize_sub_admin
    return if user_signed_in? && (current_user.admin? || @sub_admin)

    redirect_to root_path, alert: NEED_PRIVILEGES_MESSAGE
  end

  def remove_attachment
    Attachment.delete(params[:id])
    redirect_to :back
  end

  protected

  def configure_devise_permitted_parameters
    registration_params = [:first_name, :last_name, :email, :generation,
                           :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(registration_params << :current_password)
      end
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(registration_params)
      end
    end
  end
end
