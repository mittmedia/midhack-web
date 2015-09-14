# == Schema Information
#
# Table name: waitlists
#
#  id           :integer          not null, primary key
#  human_id     :integer
#  spot_offered :datetime
#  team_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_waitlists_on_human_id  (human_id)
#  index_waitlists_on_team_id   (team_id)
#

require 'rails_helper'

RSpec.describe Waitlist, type: :model do
  before(:each) do
    @waitlist = FactoryGirl.create(:waitlist)
  end

  describe 'human association' do
    it 'cannot be nil' do
      expect(@waitlist.update(human: nil)).to eq(false)
    end

    it 'cannot collide with other whitelist entry' do
      human = @waitlist.human
      other_waitlist_entry = FactoryGirl.create(
        :waitlist,
        team: FactoryGirl.create(:unique_team)
      )
      expect(other_waitlist_entry.update(human: human)).to eq(false)
    end
  end
end
