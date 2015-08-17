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

class Course < ActiveRecord::Base
  has_many :humen
  default_scope { order("#{table_name}.name ASC") }

  def self.valid_education? (course_code, year)
    course = Course.find_by(code: course_code)
    return false if course.blank?

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
