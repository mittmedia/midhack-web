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

class Institution < ActiveRecord::Base
  has_many :courses
end
