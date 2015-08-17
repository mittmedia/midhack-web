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

FactoryGirl.define do
  factory :course do
    code 'tdtea'
    points 300
    name 'Civ.ing. datateknik'
    competence 'it'
  end
end
