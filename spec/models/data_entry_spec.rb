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
#
# Indexes
#
#  index_data_entries_on_data_category_id  (data_category_id)
#

require 'rails_helper'

RSpec.describe DataEntry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
