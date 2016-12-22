# == Schema Information
#
# Table name: faqs
#
#  id         :integer          not null, primary key
#  question   :string
#  answer     :string
#  frequent   :boolean          default("false")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Faq < ApplicationRecord
  validates_presence_of :question

  validates :question, uniqueness: true, length: { maximum: 1000 }
  validates :answer, length: { maximum: 1500 }
end
