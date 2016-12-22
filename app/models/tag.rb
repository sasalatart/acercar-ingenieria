# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  category   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  VALID_CATEGORIES = ['Majors', 'Departamento y Programas', 'Tipo de Actividad', 'Tipo de Publicacion']

  has_many :taggings, dependent: :destroy
  has_many :topics, through: :taggings, source: :taggable, source_type: 'Topic'
  has_many :virtual_rooms, through: :taggings, source: :taggable, source_type: 'VirtualRoom'

  validates_presence_of :category, :name

  validate :proper_category

  scope :majors_type, -> { where(category: 'Majors') }
  scope :department_type, -> { where(category: 'Departamento y Programas') }
  scope :activity_type, -> { where(category: 'Tipo de Actividad') }
  scope :publication_type, -> { where(category: 'Tipo de Publicacion') }

  private

  def proper_category
    return if VALID_CATEGORIES.include?(category)

    errors.add(:category, 'must be of the correct type')
  end
end
