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

literature = DataCategory.create({
  slug: 'literature',
  priority: 3
})

articles = DataCategory.create({
  slug: 'articles',
  priority: 4
})

sources = DataCategory.create({
  slug: 'sources',
  priority: 5
})

tools = DataCategory.create({
  slug: 'tools',
  priority: 6
})

DataEntry.create([
  {
    url: 'http://www.kandulova.se/',
    heading: 'Kan Du Lova?',
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
    url: 'https://docs.google.com/document/d/11MsE976669KxEzNfFh25we7LVoc8_DrDIcRQREBzGz4/edit',
    heading: 'Get started with data journalism',
    summary: 'Nils Mulvad och Helena Bengtsson har skapat en kortfattad introduktion som kan ses som en kortfattat beskriven red route för datajournalistik.',
    priority: -1,
    data_category: tutorials
  },
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
  },
  {
    url: 'http://gijn.org/2015/02/25/drilling-down-a-quick-guide-to-free-and-inexpensive-data-tools/',
    heading: 'En snabbguide till gratis verktyg',
    summary: 'Nils Mulvad har skrivit ihop en snabbguide till olika bra verktyg att använda inom datajournalistik.',
    priority: 8,
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
    summary: 'Extension till firefox som låter dig välja vilka delar av en hemsida du ska ladda ner.',
    priority: 12,
    data_category: tools
  },
  {
    url: 'http://heinejoergensen.tumblr.com/post/100494714931/handout-dataskup-2014-dataseminar-i-norge',
    heading: 'Heine Jørgensens sammanställning',
    summary: 'En samling med massor av användbara verktyg.',
    priority: 13,
    data_category: tools
  },
  {
    url: 'http://openrefine.org/download.html',
    heading: 'Open Refine',
    summary: 'Ladda ner google refine. Bra verktyg för att städa och strukturera smutsigt data.',
    priority: 14,
    data_category: tools
  },
  {
    url: 'http://kb.tableau.com/articles/knowledgebase/addin-reshaping-data-excel',
    heading: 'Tableau Excel Reshaping Add-in',
    summary: 'Verktyg för att snygga till excel för export till Tableau (Endast till PC).',
    priority: 15,
    data_category: tools
  },
  {
    url: 'https://www.silk.co',
    heading: 'Silk',
    summary: 'Nytt visualiseringsprogram som är responsivt för telefoner',
    priority: 16,
    data_category: tools
  },
  {
    url: 'http://vis.occrp.org',
    heading: 'VIS',
    summary: 'Ett gratisprogram för visualisering av nätverk. Kan exporteras till Iframe, bygger på html5. Open source.',
    priority: 17,
    data_category: tools
  },
  {
    url: 'http://graph.tips/',
    heading: 'Sökmotor för facebook graph',
    summary: 'Kolla innehåll på låsta Facebooksidor',
    priority: 18,
    data_category: tools
  },
  {
    url: 'http://researchclinic.net',
    heading: 'Research Clinic',
    summary: 'Paul Myers samling av undersökande journalism, länkar och verktyg. Myers arbetar för BBC.',
    priority: 19,
    data_category: tools
  },
  {
    url: 'http://www.jonloomer.com/2013/06/18/facebook-graph-search-business-examples/',
    heading: 'Facebook Graph Search Tutorial',
    summary: 'En genomgång av hur man kan kartlägga information om följare av en facebooksida.',
    priority: 20,
    data_category: tools
  },
  {
    url: 'https://regex101.com/',
    heading: 'Regex101.com — Bästa Regex-verktyget',
    summary: 'Fungerar för pcre(php, perl), javascript och python',
    priority: 21,
    data_category: tools
  },
  {
    url: 'http://rubular.com/',
    heading: 'Rubular.com — Bästa Ruby-regex-verktyget',
    summary: 'Fungerar för programmeringsspråket Rubys regex-motor',
    priority: 22,
    data_category: tools
  },
  {
    url: 'http://www.regexplanet.com/advanced/java/index.html/',
    heading: 'Regexplanet — Mest heltäckande regex-verktyget',
    summary: 'Fungerar för Go, Haskell, Java, Javascript, .NET, Perl, PHP, Ruby, TCL, XRegExp. Dock inte bäst fungerande gränssnittet. Använd regex101 eller rubular om du kan.',
    priority: 22,
    data_category: tools
  },
  {
    url: 'http://www.regexr.com/',
    heading: 'Regexr — Alternativt Javascript-regex-verktyg',
    summary: 'Bättre än regexplanet, men sämre än regex101. Stöder bara Javascript.',
    priority: 23,
    data_category: tools
  },
  {
    url: 'https://www.email-format.com',
    heading: 'Gissa E-postadressen',
    summary: 'Kan hjälpa till när man behöver gissa en epostadress till en person inom en organisation.',
    priority: 24,
    data_category: tools
  }
])
DataEntry.create([
  {
    url: 'http://apikatalogen.se/',
    heading: 'Svenska APIKatalogen',
    summary: 'Den svenska APIKatalogen med över 300 svenska API:er underhålls av Andreas Krohn, en API-junkie till utvecklare.',
    priority: 0,
    data_category: sources
  },
  {
    url: 'http://www.sundsvall.se/psidata',
    heading: 'PSI-Data Sundsvall',
    summary: 'Sundsvalls kommuns Öppna data.',
    priority: 1,
    data_category: sources
  },
  {
    url: 'http://scb.se/',
    heading: 'Statistiska centralbyrån',
    summary: 'Data från svenska myndigheter, tex befolkning, arbetsmarknad.',
    priority: 2,
    data_category: sources
  },
  {
    url: 'http://kolada.se',
    heading: 'Kolada',
    summary: 'Statistik och data från kommuner och landsting. Mycket data om allt möjligt.',
    priority: 3,
    data_category: sources
  },
  {
    url: 'https://open-data.europa.eu/sv/data',
    heading: 'Open Data Europa',
    summary: 'EU:s öppna data-samling',
    priority: 4,
    data_category: sources
  },
  {
    url: 'https://www.geodata.se/',
    heading: 'Geodata.se',
    summary: 'Geografiska data, kartor, olika myndigheters data visualiserat geografiskt.',
    priority: 5,
    data_category: sources
  },
  {
    url: 'https://www.openstreetmap.org/#map=5/51.500/-0.100',
    heading: 'Open streetmap',
    summary: 'Gratis tillgång till geografiska data i hela världen.',
    priority: 6,
    data_category: sources
  },
  {
    url: 'http://bra.se/bra/brott-och-statistik.html',
    heading: 'BRÅ',
    summary: 'Brottsförebyggande rådet. Har tonvis med brottsstatistik.',
    priority: 7,
    data_category: sources
  },
  {
    url: 'https://www.transportstyrelsen.se/sv/vagtrafik/statistik-och-register/STRADA-informationssystem-for-olyckor-skador/',
    heading: 'Transportstyrelsen — Strada',
    summary: 'Data om trafik och trafikolyckor i databasen Strada.',
    priority: 8,
    data_category: sources
  },
  {
    url: 'http://data.naturvardsverket.se/',
    heading: 'Naturvårdsverket',
    summary: 'Miljödata, utsläpp, vattenkvalitet, mm.',
    priority: 9,
    data_category: sources
  },
  {
    url: 'https://www.msb.se/sv/Produkter--tjanster/Oppna-data/',
    heading: 'MSB',
    summary: 'Myndigheten för samhällsskydd och beredskap. Om risker, kriser, skyddsrum, olyckor med mera.',
    priority: 10,
    data_category: sources
  },
  {
    url: 'http://www.socialstyrelsen.se/statistik/statistikdatabas',
    heading: 'Socialstyrelsens',
    summary: 'Socialstyrelsens databaser över vården. Sjukdomar, dödsorsaker, läkemedel mm',
    priority: 11,
    data_category: sources
  },
  {
    url: 'http://www.folkhalsomyndigheten.se/amnesomraden/statistik-och-undersokningar/folkhalsodata/',
    heading: 'Folkhälsodata',
    summary: 'Från Folkhälsomyndigheten finns det data om folkhälsan.',
    priority: 12,
    data_category: sources
  },
  {
    url: 'http://www.svenskhandel.se/varningslistan',
    heading: 'Varningslistan',
    summary: 'Svensk handels varningslista på oseriösa företag',
    priority: 13,
    data_category: sources
  },
  {
    url: 'http://data.riksdagen.se/',
    heading: 'Riksdagen',
    summary: 'Riksdagens öppna data. Voteringar, närvaro, och mycket mycket mer.',
    priority: 14,
    data_category: sources
  },
  {
    url: 'http://comtrade.un.org/data/',
    heading: 'Comtrade - Tulldata',
    summary: 'Extremt användbar sajt med tulldata från hela världen. Även ett API. Bra för att lära sig scraping med API. Se även: https://docs.google.com/presentation/d/1F5t2JeG_nll9lIBn90nuCt5zyOqoK9gizACPvlDFfTE/edit#slide=id.g2f71b9221_0_0.',
    priority: 15,
    data_category: sources
  },
  {
    url: 'http://comtrade.un.org/data/doc/api/',
    heading: 'Comtrade - Tulldata API',
    summary: 'API-versionen av ovanstående',
    priority: 16,
    data_category: sources
  },
  {
    url: 'http://www.opengov.se/data/',
    heading: 'Opengov',
    summary: 'Svensk dataportal med stor mängd öppna myndighetsdata.',
    priority: 17,
    data_category: sources
  },
  {
    url: 'https://sites.google.com/site/opendatashoresites/OPEN-DATA/OpenDataSources/week-10',
    heading: 'Shoresite communications',
    summary: 'Portal för många olika datakällor från myndigheter.',
    priority: 18,
    data_category: sources
  },
  {
    url: 'https://opencorporates.com/',
    heading: 'open corporates',
    summary: 'En enorm databas över företag i hela världen. Med över 92 miljoner registrerade företag.',
    priority: 19,
    data_category: sources
  },
  {
    url: 'http://e-tjanster.pts.se/internet/api',
    heading: 'PTS Telefonnummer',
    summary: 'Post och Telestyrelsens API för att kunna söka vilken operatör som använder ett visst telefonnummer.',
    priority: 20,
    data_category: sources
  },
  {
    url: 'http://opendata.opennorth.se/',
    heading: 'Norrbotten och Västerbotten',
    summary: 'Öppna data om Norrbotten och Västerbotten.',
    priority: 21,
    data_category: sources
  },
  {
    url: 'http://open.stockholm.se/oppna-data',
    heading: 'Stockholm Stad',
    summary: 'Öppna data om Stockholm Stad.',
    priority: 22,
    data_category: sources
  }
])

DataEntry.create([
  {
    url: 'http://qz.com/189703/the-problem-with-data-journalism/',
    heading: 'Problem med datajournalistik',
    summary: 'Quartz-artikel om vissa problem med datajournalistiken av Allison Schrager.',
    priority: 1,
    data_category: articles
  },
  {
    url: 'http://blogg.svt.se/pejl/datajournalistik/vi-satte-datajournalistiken-pa-kartan/',
    heading: 'Summering av SVT Pejl 2010',
    summary: 'Teamet bakom valpejl bloggar ett retrospektiv av SVT Pejl 2010. Projektet gjorde att de till slut vann Stora Journalistpriset 2010.',
    priority: 2,
    data_category: articles
  },
  {
    url: 'http://www.tandfonline.com/doi/pdf/10.1080/1461670X.2014.939852',
    heading: 'Data Journalism in the US',
    summary: 'Data Journalism in the United States: Beyond the “usual suspects”. ',
    priority: 3,
    data_category: articles
  },
  {
    url: 'http://web.ebscohost.com/ehost/pdfviewer/pdfviewer?sid=038ae802-b0ca-471d-8071-dee84d144509%40sessionmgr198&vid=1&hid=102',
    heading: 'Data journalism in the UK',
    summary: 'Data journalism in the UK: a preliminary analysis of form and content. Megan Knight, Journal of Media Practice, 02 January 2015, Vol.16(1), p.55-72',
    priority: 4,
    data_category: articles
  },
  {
    url: 'http://www.eipa.eu/files/repository/eipascope/20110912103927_EipascopeSpecialIssue_Art2.pdf ',
    heading: 'Transparency and Access to Documents in the EU',
    summary: 'Transparency and Access to Documents in the EU: Ten Years on from the Adoption of Regulation 1049/2001. Författare: Maja Augustyn, Research Assistant, EIPA Maastricht 2010-2011 Cosimo Monda, Senior Lecturer, EIPA Maastricht 2004-present',
    priority: 5,
    data_category: articles
  }
])

DataEntry.create([
  {
    url: 'http://datajournalismhandbook.org/1.0/en/',
    heading: 'The data journalism Handbook',
    summary: "Titel: The data journalism Handbook. Författare: (Red) Jonathan Gray, Liliana Bounegru, Lucy Chambers. Utgivare: O'Reilly Media. Utgiven July 2012. Print ISBN: 978-1-4493-3006-4| ISBN 10:1-4493-3006-1. Ebook ISBN:978-1-4493-3001-9| ISBN 10:1-4493-3001-0",
    priority: 1,
    data_category: literature
  },
  {
    url: 'http://www.tcij.org/sites/default/files/u4/Data%20Journalism%20Book.pdf',
    heading: 'Data journalism',
    summary: "Titel: Data journalism. Författare:  Elena Egawhary and Cynthia O’Murchu. Utgivare: Centre for investigative journalism, CIJ.",
    priority: 2,
    data_category: literature
  },
  {
    url: 'http://regex.bastardsbook.com/',
    heading: 'The Bastards Book of Regular Expressions',
    summary: "Finding patterns in everyday text. Handbok om regular expressions. Författare: Dan Nguyen",
    priority: 3,
    data_category: literature
  },
  {
    url: 'http://webbutik.skl.se/sv/artiklar/allmanna-handlingar.html',
    heading: 'Allmänna handlingar hos kommunala och landstingskommunala företag',
    summary: "Titel: Allmänna handlingar hos kommunala och landstingskommunala företag (12 sidor). Upplaga: 2011. Webbadress: http://skl.se. Kommentar: Utgiven av SKL, Utgivare: Sveriges kommuner och landsting samt Riksarkivet ",
    priority: 4,
    data_category: literature
  },
  {
    url: 'http://www.government.se/sb/d/108/a/139017',
    heading: 'Allmänna handlingar i elektronisk form',
    summary: "Titel: Allmänna handlingar i elektronisk form - offentlighet och integritet. Upplaga: SOU 2010:4 ",
    priority: 5,
    data_category: literature
  },
  {
    url: 'http://www.regeringen.se/content/1/c6/23/50/91/e812fd5e.pdf',
    heading: 'Betänkande av PSI-utredningen',
    summary: "Titel: Betänkande av PSI-utredningen: SOU 2014:10 Ett steg vidare – nya regler och åtgärder för att främja vidareutnyttjande av handlingar. Upplaga: Senaste upplagan. Kommentar: ",
    priority: 6,
    data_category: literature
  },
  {
    url: 'http://www.nordicom.gu.se/sites/default/files/kapitel-pdf/nygren_et_al.pdf',
    heading: 'Datajournalistik, ett växande område',
    summary: "Nordicom, Gunnar Nygren, Ester Appelgren & Helge Hüttenrauch",
    priority: 7,
    data_category: literature
  },
  {
    url: 'http://www.tandfonline.com/doi/pdf/10.1080/21670811.2014.884344',
    heading: 'Data Journalism in Sweden.',
    summary: "Introducing new methods and genres of journalism into “old” organizations. Författare: Ester Appelgrena & Gunnar Nygren",
    priority: 8,
    data_category: literature
  },
  {
    url: 'http://www.riksdagen.se/sv/Dokument-Lagar/Lagar/Svenskforfattningssamling/_sfs-1949-105/#K2',
    heading: 'Allmänna handlingars offentlighet',
    summary: "Om allmänna handlingar i Tryckfrihetsförordningen: 2 kap 3§.",
    priority: 9,
    data_category: literature
  },
  {
    url: 'http://www.regeringen.se/sb/d/19838/a/257001',
    heading: 'Myndighetsdatalagen',
    summary: "Titel: Myndighetsdatalag, slutbetänkande. Upplaga: SOU 2015:39. Utgiven: 8 april 2015. Typ: Statens offentliga utredningar (SOU). Avsändare: Justitiedepartementet.",
    priority: 10,
    data_category: literature
  },
  {
    url: 'http://eur-lex.europa.eu/legal-content/SV/TXT/PDF/?uri=CELEX:32001R1049&from=EN',
    heading: 'Europaparlamentets och Rådets Förordning',
    summary: "Titel: EUROPAPARLAMENTETS OCH RÅDETS FÖRORDNING (EG) nr 1049/2001 av den 30 maj 2001 om allmänhetens tillgång till Europaparlamentets, rådets och kommissionens handlingar.",
    priority: 11,
    data_category: literature
  }
])
