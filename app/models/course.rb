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

class Course < ActiveRecord::Base
  belongs_to :institution
  default_scope { order("#{table_name}.name ASC") }

  def self.valid_education? (institution_code, course_code, year)
    course = Course.find_by(code: course_code)
    return false if course.blank?
    return false unless course.institution.code == institution_code

    # max_years = course.points/60
    if 1 <= year && year <= course.max_years()
      return true
    end
    false
  end

  def max_years
    points/60
  end
end
