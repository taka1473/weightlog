Rails.application.routes.draw do
  root to: 'toppages#top'
  
  get 'signup', to: 'users#new'
  resources :users, only:[:show, :new, :create]
end
