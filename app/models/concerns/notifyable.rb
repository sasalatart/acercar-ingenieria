module Notifyable
  extend ActiveSupport::Concern

  included do
    has_many :notifications, as: :notifyable, dependent: :destroy
  end

  def correct_admin_rank(notificator, notificator_admin_rank)
    return false unless notificator_admin_rank
    return true if notificator_admin_rank == -1 && notificator.admin?
    return true if notificator_admin_rank > 0 && MajorAdmin.find_by(user_id: notificator.id, major_id: notificator_admin_rank)
    notificator_admin_rank.zero?
  end

  def notify(notifyable, action, notificator, user_collection, notificator_admin_rank)
    user_collection.each do |user|
      next unless notificator != user
      notification = Notification.new
      notification.user = user
      notification.notificator = notificator
      notification.notifyable = notifyable
      notification.action = action
      notification.notificator_admin_rank = notificator_admin_rank
      notification.save
      user.notifications << notification
    end
  end
end
