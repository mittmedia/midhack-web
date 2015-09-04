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

require 'attribute_defaults'

class Human < ActiveRecord::Base
  attr_default :uuid do
    SecureRandom.uuid
  end
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,63})\z/i
  blacklisted_domains = /example\.com|example\.org/
  validates_uniqueness_of :email, allow_blank: true, message: I18n.t('validation.unique_email')
  validates_format_of :email, allow_blank: true, with: email_regex, message: I18n.t('validation.invalid_email')
  validates_format_of :email, allow_blank: true, without: blacklisted_domains, message: I18n.t('validation.blacklisted_domain')
  has_many :waitlists, dependent: :delete_all
  belongs_to :course
  belongs_to :team
  belongs_to :competence

  def signed_up?
    !course.blank? && !team.blank? && !competence.blank? && !email.blank?
  end

end
