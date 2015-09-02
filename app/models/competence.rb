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

class Competence < ActiveRecord::Base
  has_many :humen
  def singular
    titles[name.to_sym][:singular]
  end

  def plural
    titles[name.to_sym][:plural]
  end

  def field
    titles[name.to_sym][:field]
  end

  def count
    humen.count
  end

  private

  def titles
    {
      economics: { plural: 'ekonomer', singular: 'ekonom', field: 'Affärsutveckling' },
      gd: { plural: 'designers', singular: 'designer', field: 'Design/Kommunikation' },
      it: { plural: 'programmerare', singular: 'programmerare', field: 'Programmering' },
      journalism: { plural: 'journalister', singular: 'journalist', field: 'Journalistik' }
    }
  end
end
