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

FactoryGirl.define do

  to_create do |instance|
    unless instance.save
      raise "Invalid record: " + instance.errors.full_messages.join(", ")
    end
  end

  factory :human do
    sequence(:id)
    uuid SecureRandom.uuid

    trait :educated do
      association :course, factory: :course, strategy: :create
      study_year 2
    end

    trait :competent do
      association :competence, factory: :competence, strategy: :create
    end

    trait :member do
      association :team, factory: :team, strategy: :create
      signed_up true
      email_confirmation_hash { generate_email_confirmation_hash }
      confirm_email_expire_at { DateTime.parse("2015-12-01 20:10:15 +0100") }
    end

    trait :email do
      email 'dmu@mittmedia.se'
    end

    factory :educated_human, traits: [:educated]
    factory :competent_educated_human, traits: [:competent, :educated]
    factory :unregistered_competent_educated_member, traits: [:competent, :educated, :member]
    factory :member, traits: [:competent, :educated, :member, :email]
  end
end
