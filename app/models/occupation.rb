class Occupation
  def initialize
    @course = nil
    @year = 0
  end

  def self.possible_guild
    [
      {
        code: :journalist,
        name: 'Journalist'
      },
      {
        code: :journalist,
        name: 'Fotograf'
      },
      {
        code: :evangelist,
        name: 'Inspiratör/Entrepenör'
      },
      {
        code: :developer,
        name: 'Utvecklare'
      },
      {
        code: :ux,
        name: 'Grafiker/UX'
      }
    ]
  end

  def self.possible_studies
    [
      {
        code: :iks,
        name: 'Information- och kommunikationssystem',
        courses: [
          {
            code: 'tdtea',
            points: 300,
            name: 'Civ.ing. datateknik',
            competence: 'it'
          },
          {
            code: 'tinda',
            points: 300,
            name: 'Civ.ing. industriell ekonomi',
            competence: 'economics'
          },
          {
            code: 'tdatg',
            points: 180,
            name: 'Datateknik',
            competence: 'it'
          },
          {
            code: 'tandg',
            points: 120,
            name: 'Mobila applikationer och nätverkstjänster för Android',
            competence: 'it'
          }
        ]
      },
      {
        code: :mkv,
        name: 'Medie- och kommunikationsvetenskap',
        courses: [
          {
            code: 'sinpg',
            points: 180,
            name: 'Informations- och PR-programmet',
            competence: 'journalism'
          },
          {
            code: 'sjoug',
            points: 180,
            name: 'Journalistprogrammet',
            competence: 'journalism'
          },
          {
            code: 'tgdkg',
            points: 180,
            name: 'Grafisk design och kommunikation',
            competence: 'gd'
          },
          {
            code: 'tgdog',
            points: 180,
            name: 'Grafisk design och kommunikation',
            competence: 'gd'
          }
        ]
      },
      {
        code: :dsv,
        name: 'Data- och systemvetenskap',
        courses: [
          {
            code: 'tnätg',
            points: 120,
            name: 'Nätverksdrift',
            competence: 'it'
          },
          {
            code: 'tweug',
            points: 120,
            name: 'Webbutveckling',
            competence: 'it'
          }
        ]
      }
    ]
  end
end
