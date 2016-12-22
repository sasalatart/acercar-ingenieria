class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about_us, :credits]

  def index
    @images = LandingPhoto.where(pinned: true).sample(5)
    @count = @images.size
  end

  def about_us
  end

  def credits
  end

  def account
    @majors = current_user.majors

    @major_admin = Major.joins(:major_admins)
                        .where(major_admins: { user_id: current_user.id })

    @distinguished_section_admin = DistinguishedSection.joins(:distinguished_section_admins)
                                                       .where(distinguished_section_admins: { user_id: current_user.id })
  end
end
