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
#

require 'attribute_defaults'

class Human < ActiveRecord::Base
  attr_default :uuid do
    SecureRandom.uuid
  end

  def self.possible_studies
    studies = {
      iks: {
        name: 'Information- och kommunikationssystem',
        courses: {
          tdtea: 'Civ.ing. datateknik',
          tinda: 'Civ.ing. industriell ekonomi',
          tdatg: 'Datateknik',
          tandg: 'Mobila applikationer och nätverkstjänster för Android'
        }
      },
      mkv: {
        name: 'Medie- och kommunikationsvetenskap',
        courses: {
          sinpg: 'Informations- och PR-programmet',
          sjoug: 'Journalistprogrammet',
          tgdkg: 'Grafisk design och kommunikation',
          tgdog: 'Grafisk design och kommunikation'
        }
      },
      dsv: {
        name: 'Data- och systemvetenskap',
        courses: {
          tnätg: 'Nätverksdrift',
          tweug: 'Webbutveckling'
        }
      }
    }
  end
end
