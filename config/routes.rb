Rails.application.routes.draw do
  # resources :humen

  #0
  root 'onboarder#index'

  #1
  get 'what', to: 'onboarder#what', as: 'what'
  #2
  get 'choose_education', to: 'onboarder#choose_education', as: 'choose_education'
  post 'save_education', to: 'onboarder#save_education', as: 'save_education'
  #3
  get 'choose_competence', to: 'onboarder#choose_competence', as: 'choose_competence'
  post 'save_competence', to: 'onboarder#save_competence', as: 'save_competence'
  #4
  get 'choose_team', to: 'onboarder#choose_team', as: 'choose_team'
  post 'automatic_selection', to: 'onboarder#automatic_selection', as: 'automatic_selection'
  post 'save_team', to: 'onboarder#save_team', as: 'save_team'
  #5
  get 'fill_email', to: 'onboarder#fill_email', as: 'fill_email'
  post 'save_email', to: 'onboarder#save_email', as: 'save_email'
  #6
  post 'confirmation', to: 'onboarder#confirmation', as: 'confirmation'
  #7
  get 'receipt(/:uuid)', to: 'onboarder#receipt', as: 'receipt'


  get 'why', to: 'onboarder#why', as: 'why'
  get 'ical', to: 'onboarder#ical', as: 'ical'

  if ENV['RAILS_ENV'] == 'development'
    get 'admin', to: 'admin#index', as: 'admin'
    get 'styles', to: 'admin#styles', as: 'styles'
  end
end
