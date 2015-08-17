# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  code       :string
#  points     :integer
#  name       :string
#  competence :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_courses_on_code  (code) UNIQUE
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
