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

require 'rails_helper'

RSpec.describe Waitlist, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
