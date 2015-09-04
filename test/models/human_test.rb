# == Schema Information
#
# Table name: humen
#
#  id                 :integer          not null, primary key
#  name               :string
#  email              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  uuid               :string
#  team_id            :integer
#  study_year         :integer
#  course_id          :integer
#  competence_id      :integer
#  signed_up          :boolean          default("false")
#  welcome_email_sent :boolean          default("false")
#
# Indexes
#
#  index_humen_on_competence_id  (competence_id)
#  index_humen_on_course_id      (course_id)
#  index_humen_on_team_id        (team_id)
#

require 'test_helper'

class HumanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
