Rails.application.routes.draw do
  resources :humen

  #0
  root 'onboarder#index'

  #1
  get 'onboarder/what', as: 'what'
  #2
  get 'onboarder/signup', as: 'signup'
  #3
  post 'onboarder/choose_team', as: 'choose_team'

  #4
  post 'onboarder/fill_email', as: 'fill_email'

  post 'onboarder/confirmation', as: 'confirmation'

  get 'onboarder/why', as: 'why'
  get 'onboarder/ical', as: 'ical'


end
