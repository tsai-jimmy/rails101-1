# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  group_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
	belongs_to :user
  belongs_to :group
  validates :content, presence: true

  scope :recent, -> { order("created_at DESC")}
end
