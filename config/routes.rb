Rails.application.routes.draw do

  #Registration:
  root 'information#index'
  get 'signup_closed', to: 'registration#signup_closed', as: 'signup_closed'
  get 'signup', to: 'registration#signup', as: 'signup'

  #informational routes
  get 'why', to: redirect('/what')
  get 'what', to: 'information#what', as: 'what'
  get 'policy', to: 'information#policy', as: 'policy'
  get 'data', to: 'information#data', as: 'data'
  get 'kandulova', to: 'information#kandulova', as: 'kandulova'
  get '/kandulova_dump', to: redirect('/kandulova_dump/')
  get 'programme', to: 'information#programme', as: 'programme'
  get 'program', to: 'information#programme', as: 'program'
  get 'programmet', to: 'information#programme', as: 'programmet'
  get 'ical', to: 'information#ical', as: 'ical'

  if ENV['RAILS_ENV'] == 'development'
    get 'admin', to: 'admin#index', as: 'admin'
    get 'styles', to: 'admin#styles', as: 'styles'
  end
end
