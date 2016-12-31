# == Schema Information
#
# Table name: topics
#
#  id                :integer          not null, primary key
#  title             :string
#  description       :text
#  status            :string           default("unarchived")
#  user_admin_rank   :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  impressions_count :integer          default("0")
#  comments_count    :integer          default("0")
#

class Topic < ApplicationRecord
  include Taggable
  include Archivable
  include Notifyable
  include Enrollable

  after_create :enroll_and_notify

  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :impressions, as: :impressionable, dependent: :destroy

  validates_presence_of :title, :description, :status, :user_admin_rank, :user

  validate :valid_admin_rank

  scope :archived, -> { where(status: ARCHIVED_STATUS) }
  scope :unarchived, -> { where(status: UNARCHIVED_STATUS) }
  scope :most_seen, -> { unarchived.order('impressions_count DESC') }
  scope :most_commented, -> { unarchived.order('comments_count DESC') }

  def views
    impressions.size
  end

  def self.archive_old
    unarchived.joins(:comments).each do |topic|
      topic.archive if topic.comments.last.created_at + 10.days < DateTime.now
    end
  end

  private

  def valid_admin_rank
    return if correct_admin_rank(user, user_admin_rank)

    errors.add(:user_admin_rank, 'Invalid')
  end

  def enroll_and_notify
    user.enroll(id, self.class.name).save

    return unless user_admin_rank.nonzero?

    users_to_notify = user_admin_rank == -1 ? User.all : Major.find_by(id: user_admin_rank).users
    notify(self, 'Create', user, users_to_notify, user_admin_rank)
  end
end
