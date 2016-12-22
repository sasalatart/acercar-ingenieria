module Subscribable
  extend ActiveSupport::Concern

  included { has_many :enrollments, dependent: :destroy }

  def enroll(enrollable_id, enrollable_type)
    enrollments.new(user_id: id,
                    enrollable_id: enrollable_id,
                    enrollable_type: enrollable_type)
  end

  def unenroll(enrollable_id, enrollable_type)
    enrollment = enrollments.find_by(enrollable_id: enrollable_id, enrollable_type: enrollable_type)
    return unless enrollment
    enrollment.destroy
  end

  def enrolled_in?(enrollable)
    enrollments.where(enrollable_type: enrollable.class.name,
                      enrollable_id: enrollable.id).any?
  end
end
