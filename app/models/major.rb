# == Schema Information
#
# Table name: majors
#
#  id                :integer          not null, primary key
#  name              :string
#  type              :string
#  description       :text
#  short_description :text
#  video_url_code    :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class Major < ApplicationRecord
  include Enrollable

  has_many :major_users, dependent: :destroy
  has_many :users, through: :major_users
  has_many :major_admins, dependent: :destroy
  has_many :faqs, foreign_key: 'major_id', class_name: 'MajorFaq', dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :notifications, as: :notifyable, dependent: :destroy

  validates :name,
            :description,
            :short_description,
            :video_url_code,
            :category,
            presence: true

  validates_uniqueness_of :name

  validates :short_description, length: { maximum: 300 }

  validates :category, format: { with: /(?:Disciplinario|Interdisciplinario)/,
                                 message: 'debe ser Disciplinario o Interdisciplinario' }

  has_attached_file :logo,
                    styles: { thumb: '200x200#' },
                    default_url: 'logo_acercar.png',
                    dependent: :destroy

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  scope :disciplinaries, -> { where(category: 'Disciplinario') }
  scope :interdisciplinaries, -> { where(category: 'Interdisciplinario') }
end
