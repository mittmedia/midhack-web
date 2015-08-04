# == Schema Information
#
# Table name: humen
#
#  id         :integer          not null, primary key
#  name       :string
#  occupation :string
#  email      :string
#  knowledge  :string
#  social     :string
#  news       :string
#  phoneos    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uuid       :string
#  step       :integer
#  team_id    :integer
#
# Indexes
#
#  index_humen_on_team_id  (team_id)
#

require 'attribute_defaults'

class Human < ActiveRecord::Base
  attr_default :uuid do
    SecureRandom.uuid
  end
end
