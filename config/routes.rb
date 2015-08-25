Rails.application.routes.draw do
  # resources :humen

  #0
  root 'onboarder#index'

  #1
  get 'what', to: 'onboarder#what', as: 'what'
  #2
  get 'signup', to: 'onboarder#signup', as: 'signup'
  #3
  post 'choose_competence', to: 'onboarder#choose_competence', as: 'choose_competence'
  #4
  post 'choose_team', to: 'onboarder#choose_team', as: 'choose_team'
  #5
  post 'automatic_selection', to: 'onboarder#automatic_selection', as: 'automatic_selection'
  #6
  post 'fill_email', to: 'onboarder#fill_email', as: 'fill_email'
  #7
  post 'confirmation', to: 'onboarder#confirmation', as: 'confirmation'
  #8
  get 'receipt(/:uuid)', to: 'onboarder#receipt', as: 'receipt'

  get 'why', to: 'onboarder#why', as: 'why'
  get 'ical', to: 'onboarder#ical', as: 'ical'

  if ENV['RAILS_ENV'] == 'development'
    get 'admin', to: 'admin#index', as: 'admin'
    get 'styles', to: 'admin#styles', as: 'styles'
  end
end
