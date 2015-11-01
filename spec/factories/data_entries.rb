# == Schema Information
#
# Table name: data_entries
#
#  id               :integer          not null, primary key
#  url              :string
#  heading          :string
#  summary          :text
#  priority         :integer
#  data_category_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  image_path       :string
#
# Indexes
#
#  index_data_entries_on_data_category_id  (data_category_id)
#

FactoryGirl.define do
  factory :data_entry do
    url "MyString"
heading "MyString"
summary "MyText"
priority 1
data_category nil
  end

end
