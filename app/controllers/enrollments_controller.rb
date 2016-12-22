class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @enrollment = current_user.enroll(params[:enrollable_id], params[:enrollable_type])

    status = @enrollment.save ? 200 : 400
    render nothing: true, status: status, content_type: :script
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:enrollable_id, :enrollable_type)
  end
end
