Rails.application.routes.draw do
  resources :humen

  get 'onboarder/signup', as: 'signup'
  post 'onboarder/choose_team', as: 'choose_team'
  get 'onboarder/what', as: 'what'
  get 'onboarder/why', as: 'why'
  get 'onboarder/ical', as: 'ical'

  root 'onboarder#index'
end
