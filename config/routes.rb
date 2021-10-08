Rails.application.routes.draw do
  get 'tasks/edit'
  get 'tasks/update'
  # get 'teams/new', as: 'new_team'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#index"
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :teams, only: [:index, :new, :create, :show] do 
    resources :lists, only: [:new, :create, :edit, :update]
  end
end
