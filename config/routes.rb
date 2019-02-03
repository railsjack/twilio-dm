Rails.application.routes.draw do
  get 'gmaps/index'
  get     'login', to: 'sessions#new'
  post    'login', to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'
  delete  'logout', to: 'sessions#destroy'

  get 'contact', to: 'contacts#new'
  get 'portfolio', to: 'case_studies#index'
  get 'case-studies/hr'
  get 'industries/healthcare'
  get 'industries/retail'
  get 'industries/digital'
  get 'industries/logistics'
  get 'industries/travel'
  get 'industries/media'
  get 'skills', to: 'skills#index'
  get 'skills/laravel'
  get 'skills/codeigniter'
  get 'skills/symfony'
  get 'skills/ror'
  get 'skills/reactnative'
  get 'skills/reactjs'
  get 'skills/vuejs'
  get 'skills/android'
  get 'skills/nodejs'
  get 'skills/swift'
  get 'skills/ios'
  get 'skills/angularjs'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  get '/application-development', to: 'static_pages#application_development'
  get '/application-maintenance', to: 'static_pages#application_maintenance'
  get '/application-modernization', to: 'static_pages#application_modernization'
  get '/testing-qa', to: 'static_pages#testing_qa'
  get '/co-development', to: 'static_pages#co_development'
  get '/dedicated-development-teams', to: 'static_pages#dedicated_development_teams'
  get '/geocoder4rails', to: 'gmaps#geocoder4rails'

  get '/twilios/send_test', to: 'twilios#send_test'
  post '/twilio-api/recv-sms', to: 'twilios#recv_sms'
  get '/twilio-api/recv-sms-test', to: 'twilios#recv_sms_test'

  get '/twilio-api', to: 'twilio_histories#iframe'
  get '/twilio_histories/:id/delete', to: 'twilio_histories#destroy'


  resources :microposts
  resources :users
  resources :contacts
  resources :gmaps
  resources :twilio_histories


  #root "static_pages#home"
  root "twilio_histories#iframe"
end
