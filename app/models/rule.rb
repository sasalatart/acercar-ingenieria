# == Schema Information
#
# Table name: rules
#
#  id         :integer          not null, primary key
#  category   :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rule < ApplicationRecord
  validates_presence_of :category, :content

  validates :category, uniqueness: true

  scope :forum, -> { where(category: 'Foro') }
  scope :virtual_rooms, -> { where(category: 'Salas Virtuales') }
end
