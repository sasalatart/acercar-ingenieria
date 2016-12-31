# == Schema Information
#
# Table name: notifications
#
#  id                     :integer          not null, primary key
#  read                   :boolean          default("false")
#  action                 :string
#  notificator_admin_rank :integer          default("0")
#  user_id                :integer
#  notificator_id         :integer
#  notifyable_type        :string
#  notifyable_id          :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notificator, class_name: :User
  belongs_to :notifyable, polymorphic: true

  validates_presence_of :user, :notificator, :notifyable

  scope :read, -> { where(read: true) }
  scope :not_read, -> { where(read: false) }

  def self.remove_old
    Notification.where('created_at < ?', DateTime.now - 30.days).destroy
  end
end
