# == Schema Information
#
# Table name: landing_photos
#
#  id                 :integer          not null, primary key
#  title              :string           default("")
#  text               :text             default("")
#  pinned             :boolean          default("false")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class LandingPhoto < ApplicationRecord
  has_attached_file :image,
                    styles: { display: '1440x880>' },
                    convert_options: { display: '-quality 90 -strip' },
                    dependent: :destroy

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_size :image, less_than: 2.megabytes
end
