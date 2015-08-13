# == Schema Information
#
# Table name: institutions
#
#  id         :integer          not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_institutions_on_code  (code) UNIQUE
#

require 'rails_helper'

RSpec.describe Institution, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
