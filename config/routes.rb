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


  get 'onboarder/why', as: 'why'
  get 'onboarder/ical', as: 'ical'


end
