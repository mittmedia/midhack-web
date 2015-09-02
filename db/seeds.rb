# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.create([
  { name: 'The Bulletin', color: '#e74c3c' },
  { name: 'The Courier', color: '#f39c12' },
  { name: 'The Gazette', color: '#d35400' },
  { name: 'The Journal', color: '#34495e' },
  { name: 'The Post', color: '#bdc3c7' },
  { name: 'The Mirror', color: '#2980b9' },
  { name: 'The Star', color: '#2980b9' },
  { name: 'The Tribune', color: '#2980b9' }
])

# Team.create([
#   { name: 'The Comet', color: '#9b59b6' },
#   { name: 'The Globe', color: '#7f8c8d' }
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
  name: "it"
})
Competence.create({
  name: "gd"
})
Competence.create({
  name: "economics"
})
Competence.create({
  name: "journalism"
})
