Rails.application.routes.draw do
  resources :humen

  #0
  root 'onboarder#index'

  #1
  get 'what', to: 'onboarder#what', as: 'what'
  #2
  get 'signup', to: 'onboarder#signup', as: 'signup'
  #3
  post 'choose_team', to: 'onboarder#choose_team', as: 'choose_team'
  #4
  post 'fill_email', to: 'onboarder#fill_email', as: 'fill_email'
  #5
  post 'confirmation', to: 'onboarder#confirmation', as: 'confirmation'
  #6
  get 'receipt(/:uuid)', to: 'onboarder#receipt', as: 'receipt'

  get 'why', to: 'onboarder#why', as: 'why'
  get 'ical', to: 'onboarder#ical', as: 'ical'



end
