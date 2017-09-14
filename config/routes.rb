Rails.application.routes.draw do
  get 'time_entries/index'
  get 'times/index'
  get 'projects/index'
  get 'developers/index'

  root to: 'projects#index'
  resources :projects
  resources :developers
  resources :time_entries

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
