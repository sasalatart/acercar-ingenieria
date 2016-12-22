# == Schema Information
#
# Table name: major_faqs
#
#  id         :integer          not null, primary key
#  question   :string
#  answer     :text
#  major_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MajorFaq < ApplicationRecord
  belongs_to :major

  validates_presence_of :major, :question, :answer

  validates :question, length: { maximum: 1000 }
  validates :answer, length: { maximum: 1500 }
end
