# == Schema Information
#
# Table name: humen
#
#  id                      :integer          not null, primary key
#  name                    :string
#  email                   :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  uuid                    :string
#  team_id                 :integer
#  study_year              :integer
#  course_id               :integer
#  competence_id           :integer
#  signed_up               :boolean          default("false")
#  welcome_email_sent      :boolean          default("false")
#  email_confirmed         :boolean          default("false")
#  email_confirmation_hash :text
#  confirm_email_expire_at :datetime
#
# Indexes
#
#  index_humen_on_competence_id  (competence_id)
#  index_humen_on_course_id      (course_id)
#  index_humen_on_signed_up      (signed_up)
#  index_humen_on_team_id        (team_id)
#  index_humen_on_uuid           (uuid)
#

require 'attribute_defaults'

class CustomEmailValidator < ActiveModel::Validator
  def validate(human)
    humen = Human.where(signed_up: true, email: human.email).where.not(id: human.id)
    if humen.length > 0
      human.errors[:email] << I18n.t('validation.unique_email')
    else
      true
    end
  end
end

class Human < ActiveRecord::Base
  attr_default :uuid do
    SecureRandom.uuid
  end
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,63})\z/i
  blacklisted_domains = /@example\.(com|org|net)\z/
  validates_with CustomEmailValidator
  validates_format_of :email, allow_blank: true, with: email_regex, message: I18n.t('validation.invalid_email')
  validates_format_of :email, allow_blank: true, without: blacklisted_domains, message: I18n.t('validation.blacklisted_domain')
  has_many :waitlists, dependent: :delete_all
  belongs_to :course
  belongs_to :team
  belongs_to :competence

  def generate_email_confirmation_hash
    return false if email.blank?
    require 'digest'
    sha256 = Digest::SHA256.new
    sha256.hexdigest "#{email}#{created_at}#{uuid}"
  end
end
