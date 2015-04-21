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
#

require 'test_helper'

class HumanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
