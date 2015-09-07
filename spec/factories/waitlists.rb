# == Schema Information
#
# Table name: waitlists
#
#  id            :integer          not null, primary key
#  human_id      :integer
#  spot_offered  :datetime
#  team_id       :integer
#  competence_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_waitlists_on_competence_id  (competence_id)
#  index_waitlists_on_human_id       (human_id)
#  index_waitlists_on_team_id        (team_id)
#

FactoryGirl.define do
  factory :waitlist do
    human
    spot_offered "2015-08-26 14:37:51"
    team
    competence
  end
end
