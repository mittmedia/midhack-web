# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Team.create([
#   { name: 'The Bulletin' },
#   { name: 'The Courier' },
#   { name: 'The Gazette' },
#   { name: 'The Journal' },
#   { name: 'The Post' },
#   { name: 'The Mirror' },
#   { name: 'The Star' },
#   { name: 'The Tribune' }
# ])

# Team.create([
#   { name: 'The Comet' },
#   { name: 'The Globe' }
# ])

# Course.create({
#   code: 'tdtea',
#   points: 300,
#   name: 'Civ.ing. datateknik'
# })
# Course.create({
#   code: 'tinda',
#   points: 300,
#   name: 'Civ.ing. industriell ekonomi'
# })
# Course.create({
#   code: 'tdatg',
#   points: 180,
#   name: 'Datateknik'
# })
# Course.create({
#   code: 'tandg',
#   points: 120,
#   name: 'Mobila applikationer och nätverkstjänster för Android'
# })

# Course.create({
#   code: 'sinpg',
#   points: 180,
#   name: 'Informations- och PR-programmet'
# })
# Course.create({
#   code: 'sjoug',
#   points: 180,
#   name: 'Journalistprogrammet'
# })
# Course.create({
#   code: 'sbjug',
#   points: 180,
#   name: 'Bildjournalistprogrammet'
# })
# # Course.create({
# #   code: 'tgdkg',
# #   points: 180,
# #   name: 'Grafisk design och kommunikation'
# # })
# Course.create({
#   code: 'tgdog',
#   points: 180,
#   name: 'Grafisk design och kommunikation'
# })

# Course.create({
#   code: 'tnätg',
#   points: 120,
#   name: 'Nätverksdrift'
# })
# Course.create({
#   code: 'tweug',
#   points: 120,
#   name: 'Webbutveckling'
# })

# Course.create({
#   code: 'tinsg',
#   points: 180,
#   name: 'Informatik med inriktning systemutveckling'
# })

# Course.create({
#   code: 'tpvag',
#   points: 180,
#   name: 'Programvaruteknik'
# })

# Competence.create({
#   name: "it",
#   max_count: 4
# })
# Competence.create({
#   name: "gd",
#   max_count: 2
# })
# Competence.create({
#   name: "economics",
#   max_count: 2
# })
# Competence.create({
#   name: "journalism",
#   max_count: 2
# })

examples = DataCategory.create({
  slug: 'examples',
  priority: 1
})

tutorials = DataCategory.create({
  slug: 'tutorials',
  priority: 2
})

tools = DataCategory.create({
  slug: 'tools',
  priority: 3
})

tools = DataCategory.create({
  slug: 'tools',
  priority: 3
})

literature = DataCategory.create({
  slug: 'literature',
  priority: 5
})

DataEntry.create([
  {
    url: 'http://www.kandulova.se/',
    heading: 'Kandulova',
    summary: 'Mittmedia och J++ skapade en tjänst där väljare kunde ställa frågor till politiken inför valet 2014. Datat som genererades användes sedan som underlag för journalistik, och löftena kan utvärderas journalistiskt i efterhand.',
    priority: -1,
    data_category: examples
  },
  {
    url: 'https://goo.gl/9OUUJb',
    heading: 'Politiskt spreadsheet',
    summary: 'Pejls alla riksdagskandidater 2014-08-27.',
    priority: 0,
    data_category: examples
  },
  {
    url: 'https://github.com/LCHansson/Kvartersregeringen',
    heading: 'Kvartersregeringen',
    summary: 'Det här är resultatet av laget Drop Tables arbete under hackathonet Hack for Sweden den 15-16 mars 2014. ”Kvartersregeringen är ett roligt och engagerande sätt att visualisera valdata. I stället för abstrakta procentsatser och pajdiagram fokuserar vi på något som alla kan ta till sig: vilka personer skulle sitta i regeringen om just ditt kvarter fått bestämma” — Love Hansson, Jens Finnäs & Jonathan Hise Kaldma.',
    priority: 0,
    data_category: examples
  },
  {
    url: 'http://china.fathom.info/',
    heading: 'Connected China',
    summary: 'Nyhetsbyrån Reuters fantastiska databas-tjänst om Kina.',
    priority: 2,
    data_category: examples
  },
  {
    url: 'http://projects.latimes.com/wardead/',
    heading: 'Californias War Dead',
    summary: 'LA Times kör script på dödsrunor och gör en nyhetstjänst om alla som dör i krig.',
    priority: 3,
    data_category: examples
  },
  {
    url: 'http://homicide.latimes.com/',
    heading: 'The homicide report',
    summary: 'LA Times kör script på coroners reports (rättsläkarens rapport) som är offentlig handling. Allt omvandlas till databas med geografisk angivelse, mordvapen mm. Dessutom gör ett script en kort notis om varje mord till webben.',
    priority: 4,
    data_category: examples
  },
  {
    url: 'http://www.themigrantsfiles.com/',
    heading: 'The migrant files',
    summary: 'Journalister från 15 länder hjälps åt att sammanställa data om flyktingar som dör på väg till tryggheten i Europa. Allt sammanställt i en databas och visualiserat.',
    priority: 5,
    data_category: examples
  },
  {
    url: 'http://journalisterna.mediestudier.se/',
    heading: 'Där bor journalisterna',
    summary: 'Institutet för mediestudier kartlade var svenska journalister bor. Journalism++ skapade en kartbaserad tjänst för detta.',
    priority: 6,
    data_category: examples
  },
  {
    url: 'http://dataelixir.com/',
    heading: 'Data Elixir',
    summary: 'Samlar god datajournalistik med massor av exempel.',
    priority: 7,
    data_category: examples
  },
  {
    url: 'http://www.postandcourier.com/tilldeath/partone.html',
    heading: 'Post and Courier — Till death do us part',
    summary: 'Pullizervinnande reportage presenterat på ett väldigt spännande sätt.',
    priority: 8,
    data_category: examples
  },
  {
    url: 'http://www.icij.org/',
    heading: 'International consortium of investigative journalism',
    summary: 'Fenomenal organisation för cross border collaboration.',
    priority: 9,
    data_category: examples
  },
  {
    url: 'http://www.generatione.eu/',
    heading: 'Generation E',
    summary: 'Crowdsourcat cross border projekt om unga migranter i Europa. Bra exempel till delen om inhämtning av data.',
    priority: 10,
    data_category: examples
  },
  {
    url: 'http://projects.icij.org/swiss-account/ ',
    heading: '#swissleaks',
    summary: 'ICIJ #swissleaks visualisering. Läcka från bank avslöjade skattesmitare i hela världen.',
    priority: 11,
    data_category: examples
  },
  {
    url: 'http://geography.oii.ox.ac.uk/',
    heading: 'Information Geographies',
    summary: 'Exempel på geografisk visualisering och mycket mer.',
    priority: 12,
    data_category: examples
  },
  {
    url: 'http://www.usatoday.com/longform/news/nation/2014/03/11/fugitives-next-door/6262719/',
    heading: 'The ones that get away',
    summary: 'USA Today: Datagräv.',
    priority: 13,
    data_category: examples
  },
  {
    url: 'http://www.lararnasnyheter.se/lararnas-tidning/2015/05/20/lararnas-behorighet-amne-din-kommun',
    heading: 'Lärarbehörighetskartan',
    summary: 'Lärarbehörighet per ämne och kommun markerat på en Sverigekarta. Exempel på kommunvisualisering, open street map.',
    priority: 14,
    data_category: examples
  }
])

DataEntry.create([
  {
    url: 'http://jplusplus.se/en-faktagranskningsmetod-for-datajournalistik/',
    heading: 'Faktagranskningsmetod — J++',
    summary: 'Metodik för att faktakontrollera datajournalistiska projekt.',
    priority: 0,
    data_category: tutorials
  },
  {
    url: 'https://github.com/propublica/guides/blob/master/data-bulletproofing.md',
    heading: 'Faktagranskningsmetod — Jennifer LaFleur, ProPublica',
    summary: 'Metodik för att faktakontrollera datajournalistiska projekt.',
    priority: 1,
    data_category: tutorials
  },
  {
    url: 'https://docs.google.com/presentation/d/18KE-VO9T6V1I_aGyekdDtFhYP4K0Saph7aBuBS3N8tc/edit#slide=id.p',
    heading: 'Faktagranskningsmetod — Christopher Groskopf, NPR',
    summary: 'Metodik för att faktakontrollera datajournalistiska projekt.',
    priority: 2,
    data_category: tutorials
  },
  {
    url: 'http://datadrivenjournalism.net/resources',
    heading: 'Data Driven Journalism',
    summary: 'Stor mängd tutorials relevanta för datajournalistik.',
    priority: 3,
    data_category: tutorials
  },
  {
    url: 'http://journalisttips.se/category/scraping/',
    heading: 'Web site scraping',
    summary: 'Backa Elias scrapingskola.',
    priority: 4,
    data_category: tutorials
  },
  {
    url: 'https://journalisttips.se/2014/08/29/analysera-sambanden-i-politiken/',
    heading: 'Visualisera samband med Infogr.am',
    summary: '',
    priority: 5,
    data_category: tutorials
  },
  {
    url: 'http://www.kaasogmulvad.dk/en/',
    heading: 'Kaas och Mulvad',
    summary: 'Om datajournalistik och analys. Danmarks kanske bästa datajournalister.',
    priority: 6,
    data_category: tutorials
  },
  {
    url: 'http://lottaholmstrom.se/2013/01/24/kartmappning-med-google-fusion-tables/',
    heading: 'Google fusion tables',
    summary: 'En tutorial om att visualisera data på en karta av Lotta Homlström.',
    priority: 7,
    data_category: tutorials
  }
])
DataEntry.create([
  {
    url: 'https://support.google.com/fusiontables/answer/2571232',
    heading: 'Google fusion tables',
    summary: 'Det kanske vanligaste och enklaste verktyget för visualisering av infografik och på kartor. Börja med att skaffa ett google-konto och ladda sedan ner applikationer som fusion tables och många andra inifrån ditt google konto.',
    priority: 0,
    data_category: tools
  },
  {
    url: 'https://infogr.am/',
    heading: 'Infogr.am',
    summary: 'Enkelt gratisverktyg för datavisualisering.',
    priority: 1,
    data_category: tools
  },
  {
    url: 'https://datawrapper.de/',
    heading: 'Datawrapper',
    summary: 'Enkelt gratisverktyg för datavisualisering.',
    priority: 2,
    data_category: tools
  },
  {
    url: 'http://timeline.knightlab.com/',
    heading: 'timeline.js',
    summary: 'Verktyg för att visualisera en tidslinje över ett händelseförlopp.',
    priority: 3,
    data_category: tools
  },
  {
    url: 'https://public.tableau.com/s/',
    heading: 'Tableau Public',
    summary: 'Lite mer avancerat verktyg för visualisering av data, som infografik, på karta eller kombinerat. Många i branschen använder detta.',
    priority: 4,
    data_category: tools
  },
  {
    url: 'http://openstreetmap.se/',
    heading: 'Open Street Map',
    summary: 'Open source digital karta, detta är den svenska delen. Kan användas som grund för kartvisualisering i kombination med flera andra program.',
    priority: 5,
    data_category: tools
  },
  {
    url: 'https://cartodb.com/',
    heading: 'Carto DB',
    summary: 'Omtyckt kartvisualiseringsprogram, går att kombinera med andra visualiserings-program. Här finns också massor av spännande exempel på kartvisualiseringar.',
    priority: 6,
    data_category: tools
  },
  {
    url: 'http://leafletjs.com/',
    heading: 'Leaflet JS',
    summary: 'Ett javascriptbibliotek för att göra interaktiva visualiseringar på tex open street maps. Extra bra för mobiltelefoner.',
    priority: 7,
    data_category: tools
  },
  {
    url: 'http://tabula.technology/',
    heading: 'Tabula',
    summary: 'Kan extrahera data från PDF till spreadsheet',
    priority: 8,
    data_category: tools
  },
  {
    url: 'https://www.overviewdocs.com/',
    heading: 'Overview Docs',
    summary: 'Strukturerar enorma mängder dokument och kategoriserar efter innehåll. Blir sökbara. Kan vara bra för analys av tex stora mängder e-post eller PDF-dokument.',
    priority: 9,
    data_category: tools
  },
  {
    url: 'https://www.documentcloud.org/home',
    heading: 'Document cloud',
    summary: 'Ladda upp stora mängder data i dokument. De blir sökbara, och du kan länka från din text direkt till dokumentet. Visar på så sätt belägg för din story, höjer trovärdigheten eftersom läsaren kan kolla själv. Det blir mer engagerande. Kan sedan kopplas till Overview!',
    priority: 10,
    data_category: tools
  },
  {
    url: 'http://www.shoutkey.com/',
    heading: 'Shoutkey',
    summary: 'Kortar ner långa URL:er till korta kommunicerbara kortlivade URL:ar(max 12 timmar livstid per länk)',
    priority: 11,
    data_category: tools
  },
  {
    url: 'https://addons.mozilla.org/en-US/firefox/addon/downthemall/',
    heading: 'DownThemAll!',
    summary: 'Extension till firefox som låter dig välja vilka delar av en hemsida du ska ladda ner',
    priority: 12,
    data_category: tools
  },
  {
    url: 'http://heinejoergensen.tumblr.com/post/100494714931/handout-dataskup-2014-dataseminar-i-norge ',
    heading: 'Heine Jørgensens sammanställning',
    summary: 'En samling med massor av användbara verktyg.',
    priority: 13,
    data_category: tools
  }
])
