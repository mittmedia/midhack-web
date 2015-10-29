# == Schema Information
#
# Table name: data_categories
#
#  id         :integer          not null, primary key
#  slug       :string
#  priority   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :data_category do
    slug "MyCustomCategory"
    priority 1
  end
end
