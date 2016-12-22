# == Schema Information
#
# Table name: distinguished_sections
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class DistinguishedSection < ApplicationRecord
  has_many :distinguished_virtual_rooms, dependent: :destroy
  has_many :virtual_rooms, through: :distinguished_virtual_rooms
  has_many :distinguished_section_admins, dependent: :destroy
  has_many :admins, through: :distinguished_section_admins, foreign_key: 'user_id', class_name: 'User'

  validates_presence_of :name, :description

  validates :description, length: { maximum: 1000 }

  def add_virtual_room(user, virtual_room)
    return unless user.admin? || DistinguishedSectionAdmin.where(user: current_user, distinguished_section: self).any?

    virtual_rooms << virtual_room
  end
end
