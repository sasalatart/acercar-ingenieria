# == Schema Information
#
# Table name: virtual_rooms
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :text
#  link           :string
#  date           :datetime
#  status         :string           default("unarchived")
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comments_count :integer          default("0")
#

class VirtualRoom < ApplicationRecord
  include Taggable
  include Archivable
  include Enrollable

  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :notifications, as: :notifyable, dependent: :destroy

  scope :archived, -> { where(status: ARCHIVED_STATUS) }
  scope :unarchived, -> { where(status: UNARCHIVED_STATUS) }
  scope :soonest, -> { unarchived.where('date > ?', DateTime.now).order('date') }

  validates_presence_of :title, :description, :link, :date

  validates_format_of :link, with: /\Ahttps:\/\/talkgadget.google.com\/hangouts\/.+\Z/i

  validate :date_cannot_be_in_the_past

  def self.archive_old
    unarchived.each do |virtual_room|
      if (virtual_room.date.to_time + 6.hours) < DateTime.now
        virtual_room.update_attribute(:status, ARCHIVED_STATUS)
      end
    end
  end

  private

  def date_cannot_be_in_the_past
    errors.add(:date, 'No puede ser agendada en el pasado.') if date && date < Time.now
  end
end
