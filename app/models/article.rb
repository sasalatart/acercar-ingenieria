# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  title              :string
#  short_description  :text
#  content            :text
#  major_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Article < ApplicationRecord
  include Enrollable

  belongs_to :major

  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :notifications, as: :notifyable, dependent: :destroy

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: ->(t) { t['attachement'].nil? }

  has_attached_file :image,
                    styles: { thumb: '225x225>' },
                    default_url: 'logo_acercar.png',
                    dependent: :destroy

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :image, less_than: 2.megabytes

  validates_presence_of :title, :content, :short_description

  validates :title, uniqueness: true
  validates :short_description, length: { maximum: 300 }

  def add_categories(category_ids)
    ArticleCategory.delete_all(article: self)
    if category_ids
      categories << Category.where(id: category_ids)
    else
      category = Category.find_by(name: 'Otros')
      categories << category if category
    end
  end

  def add_documents(documents)
    return unless documents
    documents.each { |document| attachments.build(document: document) }
  end
end
