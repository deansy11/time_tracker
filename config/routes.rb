Rails.application.routes.draw do
  root to: 'sessions#index'

  get 'time_entries/index'
  get 'times/index'
  get 'projects/index'
  get 'developers/index'


  resources :projects
  resources :developers do
    resources :time_entries
  end
  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
