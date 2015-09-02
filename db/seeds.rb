# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.create([
  { name: 'The Bulletin' },
  { name: 'The Courier' },
  { name: 'The Gazette' },
  { name: 'The Journal' },
  { name: 'The Post' },
  { name: 'The Mirror' },
  { name: 'The Star' },
  { name: 'The Tribune' }
])

# Team.create([
#   { name: 'The Comet' },
#   { name: 'The Globe' }
# ])

Course.create({
  code: 'tdtea',
  points: 300,
  name: 'Civ.ing. datateknik'
})
Course.create({
  code: 'tinda',
  points: 300,
  name: 'Civ.ing. industriell ekonomi'
})
Course.create({
  code: 'tdatg',
  points: 180,
  name: 'Datateknik'
})
Course.create({
  code: 'tandg',
  points: 120,
  name: 'Mobila applikationer och nätverkstjänster för Android'
})

Course.create({
  code: 'sinpg',
  points: 180,
  name: 'Informations- och PR-programmet'
})
Course.create({
  code: 'sjoug',
  points: 180,
  name: 'Journalistprogrammet'
})
Course.create({
  code: 'sbjug',
  points: 180,
  name: 'Bildjournalistprogrammet'
})
Course.create({
  code: 'tgdkg',
  points: 180,
  name: 'Grafisk design och kommunikation'
})
Course.create({
  code: 'tgdog',
  points: 180,
  name: 'Grafisk design och kommunikation'
})

Course.create({
  code: 'tnätg',
  points: 120,
  name: 'Nätverksdrift'
})
Course.create({
  code: 'tweug',
  points: 120,
  name: 'Webbutveckling'
})

Competence.create({
  name: "it",
  max_count: 4
})
Competence.create({
  name: "gd",
  max_count: 2
})
Competence.create({
  name: "economics",
  max_count: 2
})
Competence.create({
  name: "journalism",
  max_count: 2
})
