Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resource :dashboard, only: [:show]
  end

  resources :greetings, only: [:create, :show]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get "/", to: "dashboards#show", as: :dashboard
  get "/sign_up", to: "users#new"

  root to: "sessions#new"


end
