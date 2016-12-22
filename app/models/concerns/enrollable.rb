module Enrollable
  extend ActiveSupport::Concern

  included do
    has_many :enrollments, as: :enrollable, dependent: :destroy
    has_many :enrolled_users, source: :user, through: :enrollments
  end
end
