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

class DataCategory < ActiveRecord::Base
  has_many :data_entry
end
