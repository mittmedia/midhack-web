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

require 'rails_helper'

RSpec.describe Competence, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
