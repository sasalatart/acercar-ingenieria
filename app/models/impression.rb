# == Schema Information
#
# Table name: impressions
#
#  id                  :integer          not null, primary key
#  ip_address          :string
#  user_id             :integer
#  impressionable_type :string
#  impressionable_id   :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Impression < ApplicationRecord
  belongs_to :user
  belongs_to :impressionable, polymorphic: true

  validates_presence_of :ip_address, :user, :impressionable
end
