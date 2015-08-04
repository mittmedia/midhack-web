# == Schema Information
#
# Table name: humen
#
#  id         :integer          not null, primary key
#  name       :string
#  occupation :string
#  email      :string
#  knowledge  :string
#  social     :string
#  news       :string
#  phoneos    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uuid       :string
#  step       :integer
#  team_id    :integer
#
# Indexes
#
#  index_humen_on_team_id  (team_id)
#

require 'test_helper'

class HumanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
