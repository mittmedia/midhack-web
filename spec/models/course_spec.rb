# == Schema Information
#
# Table name: courses
#
#  id             :integer          not null, primary key
#  code           :string
#  points         :integer
#  name           :string
#  competence     :string
#  institution_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_courses_on_code            (code) UNIQUE
#  index_courses_on_institution_id  (institution_id)
#

require 'rails_helper'

RSpec.describe Course, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
