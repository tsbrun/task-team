Rails.application.routes.draw do
  # get 'teams/new', as: 'new_team'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#index"
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :teams, only: [:index, :new, :create, :show] do 
    resources :lists, only: [:new, :create, :edit, :update]
    resources :tasks, only: [:edit, :update]
  end

  delete "/teams/:team_id/tasks/:id" => "tasks#destroy", as: :delete_task
  delete "/teams/:id" => "teams#destroy", as: :delete_team
  delete "/teams/:team_id/lists/:id" => "lists#destroy", as: :delete_list
end
