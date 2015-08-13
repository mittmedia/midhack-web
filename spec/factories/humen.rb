# == Schema Information
#
# Table name: humen
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uuid       :string
#  team_id    :integer
#  study_year :integer
#  course_id  :integer
#
# Indexes
#
#  index_humen_on_course_id  (course_id)
#  index_humen_on_team_id    (team_id)
#

FactoryGirl.define do
  factory :human do
    
  end

end
