# == Schema Information
#
# Table name: major_admins
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  major_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MajorAdmin < ApplicationRecord
  belongs_to :user
  belongs_to :major

  validates_presence_of :user, :major

  validates :user, uniqueness: { scope: :major,
                                 message: 'ya era administrador de este Major.' }
end
