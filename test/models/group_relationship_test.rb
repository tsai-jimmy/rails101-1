# == Schema Information
#
# Table name: group_relationships
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GroupRelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
