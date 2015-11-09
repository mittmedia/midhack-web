# == Schema Information
#
# Table name: teams
#
#  id               :integer          not null, primary key
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  overview_api_key :string
#

require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'name' do
    it 'should be required to be allowed to persist' do
      expect(Team.create().persisted?).to eq(false)
      expect(Team.create(name: 'Testteam').persisted?).to eq(true)
    end

    it 'should be a unique to be allowed to persist' do
      expect(Team.create(name: 'Testteam').persisted?).to eq(true)
      expect(Team.create(name: 'Testteam').persisted?).to eq(false)
    end
  end

  it 'has humans that are not members' do
    team = FactoryGirl.create(:team)
    h1 = FactoryGirl.create(:human, team: team)
    h2 = FactoryGirl.create(:member, team: team)
    expect(team.members).to eq([h2])
    expect(team.humen).to eq([h1, h2])
  end
end
