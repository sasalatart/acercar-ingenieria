# == Schema Information
#
# Table name: distinguished_section_admins
#
#  id                       :integer          not null, primary key
#  distinguished_section_id :integer
#  user_id                  :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class DistinguishedSectionAdmin < ApplicationRecord
  belongs_to :distinguished_section
  belongs_to :user

  validates_presence_of :distinguished_section, :user

  validates :user, uniqueness: { scope: :distinguished_section,
                                 message: 'ya era administrador de esta sección.' }
end
