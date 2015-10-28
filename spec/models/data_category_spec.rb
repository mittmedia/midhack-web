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

require 'rails_helper'

RSpec.describe DataCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
