Rails.application.routes.draw do
  root to: 'sessions#new'

  get 'time_entries/index'
  get 'times/index'
  get 'projects/index'
  get 'developers/index'


  resources :projects
  resources :developers
  resources :time_entries
  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
