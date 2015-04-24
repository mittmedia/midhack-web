class Occupation
  def self.possible_occupations
    [
      { code: :student, name: "Student" },
      { code: :journalist, name: "Journalist" },
      { code: :evangelist, name: "Inspiratör/Entrepenör" },
      { code: :developer, name: "Utvecklare" },
      { code: :ux, name: "Grafiker" }
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
    possible_studies[institution_code.to_sym][1][:courses]
  end

  def self.possible_studies
    {
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
