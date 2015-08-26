# == Schema Information
#
# Table name: humen
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  uuid          :string
#  team_id       :integer
#  study_year    :integer
#  course_id     :integer
#  competence_id :integer
#
# Indexes
#
#  index_humen_on_competence_id  (competence_id)
#  index_humen_on_course_id      (course_id)
#  index_humen_on_team_id        (team_id)
#

require 'attribute_defaults'

class Human < ActiveRecord::Base
  attr_default :uuid do
    SecureRandom.uuid
  end
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,63})\z/i
  validates :email, format: { with: email_regex }, allow_blank: true, uniqueness: true
  validates_format_of :email, :without => /example\.com|example\.org/, :message => "Ogiltig e-postadress"
  belongs_to :course
  belongs_to :team
  belongs_to :competence

  def signed_up?
    !course.blank? && !team.blank? && !competence.blank? && !email.blank?
  end

end
