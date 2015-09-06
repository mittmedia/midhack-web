# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  code       :string
#  points     :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_courses_on_code  (code) UNIQUE
#

require 'rails_helper'

RSpec.describe Course, type: :model do
  before(:each) do
    @course = FactoryGirl.create :course
  end
  describe 'points' do
    it 'should not accept 0' do
      expect(@course.update(points: 0)).to eq(false)
    end
    it 'should not be allowed to be nil' do
      expect(@course.update(points: nil)).to eq(false)
    end
    it 'should not be allowed to be negative' do
      expect(@course.update(points: -10)).to eq(false)
    end
    it 'should allow positive integers' do
      expect(@course.update(points: 10)).to eq(true)
    end
  end

  describe 'name' do
    it 'should be unique to be allowed to persist' do
      expect(@course.update(name: 'Testkurs')).to eq(true)
      other_course = FactoryGirl.create :other_course
      expect(other_course.update(name: 'Testkurs')).to eq(false)
    end
    it 'should be be filled to be allowed to persist' do
      expect(@course.update(name: '')).to eq(false)
      expect(@course.update(name: nil)).to eq(false)
    end
  end

  describe 'code' do
    it 'should be unique to be allowed to persist' do
      expect(@course.update(code: 'code')).to eq(true)
      other_course = FactoryGirl.create :other_course
      expect(other_course.update(code: 'code')).to eq(false)
    end
    it 'should be be filled to be allowed to persist' do
      expect(@course.update(code: '')).to eq(false)
      expect(@course.update(code: nil)).to eq(false)
    end
  end
end
