# == Schema Information
#
# Table name: distinguished_virtual_rooms
#
#  id                       :integer          not null, primary key
#  distinguished_section_id :integer
#  virtual_room_id          :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class DistinguishedVirtualRoom < ApplicationRecord
  belongs_to :distinguished_section
  belongs_to :virtual_room

  validates_presence_of :distinguished_section, :virtual_room
end
