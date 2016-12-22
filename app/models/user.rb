# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  generation             :integer
#  admin                  :boolean          default("false")
#

class User < ApplicationRecord
  include Importable
  include Subscribable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_save :capitalize

  has_many :major_users, dependent: :destroy
  has_many :majors, through: :major_users
  has_many :major_admins, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :virtual_rooms, dependent: :destroy
  has_many :distinguished_section_admins, dependent: :destroy
  has_many :distinguished_sections, through: :distinguished_section_admins
  has_many :notifications, dependent: :destroy

  validates :email, presence: true,
                    format: { with: /[0-9._%a-z\-]+@(?:uc|puc|ing.puc)\.cl/i,
                              message: 'debe ser del dominio UC' }

  validates :first_name, :last_name, presence: true, length: { maximum: 20 }

  validates :generation, presence: true,
                         numericality: { greater_than_or_equal_to: 1904,
                                         less_than_or_equal_to: Time.now.year }

  scope :admins, -> { where(admin: true) }

  def complete_name
    "#{first_name} #{last_name}"
  end

  def mark_as_read(notifyable)
    notifications.not_read
                 .where(notifyable_type: notifyable.class.name,
                        notifyable_id: notifyable.id)
                 .update(read: true)
  end

  def add_majors(major_ids)
    MajorUser.delete_all(user_id: id)
    return unless major_ids
    majors << Major.where(id: major_ids)
  end

  private

  def capitalize
    self.first_name = first_name.split.map(&:capitalize).join(' ')
    self.last_name = last_name.split.map(&:capitalize).join(' ')
  end
end
