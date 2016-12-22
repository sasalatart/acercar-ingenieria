class RegistrationsController < Devise::RegistrationsController
  def create
    super
    @user.add_majors(params[:user][:major_ids])
  end

  def update
    super
    @user.add_majors(params[:user][:major_ids])
  end
end
