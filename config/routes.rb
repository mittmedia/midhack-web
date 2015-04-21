Rails.application.routes.draw do
  resources :humen
  
  get 'onboarder/tour(/:step)', to: 'onboarder#tour', as: 'tour'
  get 'onboarder/why', as: 'why'
  get 'onboarder/ical', as: 'ical'
  
  root 'onboarder#index'
end
