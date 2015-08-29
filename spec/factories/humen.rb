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

FactoryGirl.define do
  factory :human do
    uuid SecureRandom.uuid

    trait :educated do
      association :course, factory: :course, strategy: :build
      study_year 2
    end

    trait :competent do
      association :competence, factory: :competence, strategy: :build
    end

    trait :member do
      association :team, factory: :team, strategy: :build
    end

    factory :educated_human, traits: [:educated]
    factory :competent_educated_human, traits: [:competent, :educated]
    factory :competent_educated_member, traits: [:competent, :educated, :member]
  end
end
