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

class Waitlist < ActiveRecord::Base
  belongs_to :human
  belongs_to :team
  belongs_to :competence

  validates :human_id, presence: true#, uniqueness: true

end
