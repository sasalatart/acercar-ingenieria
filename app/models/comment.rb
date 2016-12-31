# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :text
#  user_id          :integer
#  commentable_type :string
#  commentable_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ApplicationRecord
  include Notifyable

  after_create :enroll_and_notify

  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true

  validates :content, presence: true,
                      length: { maximum: 1000 }

  private

  def enroll_and_notify
    user.enroll(commentable.id, commentable.class.name).save
    notify(commentable, 'Comment', user, commentable.enrolled_users, 0)
  end
end
