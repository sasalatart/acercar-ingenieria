# == Schema Information
#
# Table name: major_users
#
#  id         :integer          not null, primary key
#  major_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MajorUser < ApplicationRecord
  belongs_to :major
  belongs_to :user

  validates_presence_of :major, :user

  validates :major, uniqueness: { scope: :user }
end
