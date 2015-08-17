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

require 'rails_helper'

RSpec.describe Course, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
