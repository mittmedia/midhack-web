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

FactoryGirl.define do
  factory :competence do
    name 'it'
  end
end
