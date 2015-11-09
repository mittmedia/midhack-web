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

FactoryGirl.define do
  factory :team do
    name 'testteam'
    factory :unique_team do
      sequence(:name) { |n| "testteam#{n}" }
    end
  end
end
