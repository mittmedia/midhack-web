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

class DataEntry < ActiveRecord::Base
  belongs_to :data_category
end
