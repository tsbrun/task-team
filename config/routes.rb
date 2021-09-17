Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_calbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#index"
  # get "/home", to: "application#index"
end
