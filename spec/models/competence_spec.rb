# == Schema Information
#
# Table name: competences
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  max_count  :integer          default("0")
#

require 'rails_helper'

RSpec.describe Competence, type: :model do
  before (:each) do
    @competence = FactoryGirl.create :competence
  end

  describe 'name' do
    it 'should be unique to be allowed to persist' do
      expect(@competence.update(name: 'economic')).to eq(true)
      other_competence = FactoryGirl.create :other_competence
      expect(other_competence.update(name: 'economic')).to eq(false)
    end
    it 'should be be filled to be allowed to persist' do
      expect(@competence.update(name: '')).to eq(false)
      expect(@competence.update(name: nil)).to eq(false)
    end
  end

  describe 'max_count' do
    it 'should not be negative to be valid' do
      expect(@competence.update(max_count: -1)).to eq(false)
    end
    it 'should be valid if 0' do
      expect(@competence.update(max_count: 0)).to eq(true)
    end
    it 'should be valid if larger than 0' do
      expect(@competence.update(max_count: 1)).to eq(true)
    end
  end
end
