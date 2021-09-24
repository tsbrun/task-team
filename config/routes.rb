Rails.application.routes.draw do
  get 'teams/new', as: 'new_team'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#index"
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
end
