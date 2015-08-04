class Occupation
  def self.possible_occupations
    [
      { code: :student, name: 'Student' },
      { code: :working, name: 'Arbetande' }
    ]
  end

  def self.possible_guild
    [
      { code: :journalist, name: 'Journalist' },
      { code: :journalist, name: 'Fotograf' },
      { code: :evangelist, name: 'Inspiratör/Entrepenör' },
      { code: :developer, name: 'Utvecklare' },
      { code: :ux, name: 'Grafiker/UX' }
    ]
  end

  def self.possible_institutions
    studies = possible_studies
    institutions = []
    studies.each do |institution|
      institutions << {
        code: institution[0],
        name: institution[1][:name]
      }
    end
    institutions
  end

  def self.possible_courses(institution_code)
    possible_studies[institution_code.to_sym][:courses]
  end

  def self.possible_studies
    {
      iks: {
        name: 'Information- och kommunikationssystem',
        courses: [
          {code: 'tdtea', name: 'Civ.ing. datateknik', competence: 'it'},
          {code: 'tinda', name: 'Civ.ing. industriell ekonomi', competence: 'economics'},
          {code: 'tdatg', name: 'Datateknik', competence: 'it'},
          {code: 'tandg', name: 'Mobila applikationer och nätverkstjänster för Android', competence: 'it'}
        ]
      },
      mkv: {
        name: 'Medie- och kommunikationsvetenskap',
        courses: [
          {code: 'sinpg', name: 'Informations- och PR-programmet', competence: 'journalism'},
          {code: 'sjoug', name: 'Journalistprogrammet', competence: 'journalism'},
          {code: 'tgdkg', name: 'Grafisk design och kommunikation', competence: 'gd'},
          {code: 'tgdog', name: 'Grafisk design och kommunikation', competence: 'gd'}
        ]
      },
      dsv: {
        name: 'Data- och systemvetenskap',
        courses: [
          {code: 'tnätg', name: 'Nätverksdrift', competence: 'it'},
          {code: 'tweug', name: 'Webbutveckling', competence: 'it'}
        ]
      }
    }
  end
end
