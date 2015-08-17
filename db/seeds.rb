# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.create([
  { name: 'Alisarin', color: '#e74c3c' },
  { name: 'Ametist', color: '#9b59b6' },
  { name: 'Apelsin', color: '#f39c12' },
  { name: 'Aprikos', color: '#d35400' },
  { name: 'Asbest', color: '#7f8c8d' },
  { name: 'Asfalt', color: '#34495e' },
  { name: 'Aspartam', color: '#bdc3c7' },
  { name: 'Azur', color: '#2980b9' }
])



Course.create({
  code: 'tdtea',
  points: 300,
  name: 'Civ.ing. datateknik',
  competence: 'it'
})
Course.create({
  code: 'tinda',
  points: 300,
  name: 'Civ.ing. industriell ekonomi',
  competence: 'economics'
})
Course.create({
  code: 'tdatg',
  points: 180,
  name: 'Datateknik',
  competence: 'it'
})
Course.create({
  code: 'tandg',
  points: 120,
  name: 'Mobila applikationer och nätverkstjänster för Android',
  competence: 'it'
})

Course.create({
  code: 'sinpg',
  points: 180,
  name: 'Informations- och PR-programmet',
  competence: 'journalism'
})
Course.create({
  code: 'sjoug',
  points: 180,
  name: 'Journalistprogrammet',
  competence: 'journalism'
})
Course.create({
  code: 'tgdkg',
  points: 180,
  name: 'Grafisk design och kommunikation',
  competence: 'gd'
})
Course.create({
  code: 'tgdog',
  points: 180,
  name: 'Grafisk design och kommunikation',
  competence: 'gd'
})

Course.create({
  code: 'tnätg',
  points: 120,
  name: 'Nätverksdrift',
  competence: 'it'
})
Course.create({
  code: 'tweug',
  points: 120,
  name: 'Webbutveckling',
  competence: 'it'
})
