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

FactoryGirl.define do
  factory :course do
    code 'tdtea'
    points 300
    name 'Civ.ing. datateknik'
    competence 'it'
  end
end
