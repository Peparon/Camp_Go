Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  devise_for :camp_sites, controllers: {
    sessions: 'camp_sites/sessions',
    passwords: 'camp_sites/passwords',
    registrations: 'camp_sites/registrations'
  }

  # get "camp_site", to: "camp_site/camp_sites#show"

  namespace :camp_site do
    # get "users/index" => "users#index"
    resources :camp_sites do
      resources :plans do
        resources :reservations, only: [:new, :create]
      end
    end
    resources :users do
      resources :reservations, only: [:index, :show]
    end
    resources :plans
    # resources :reservations
    # get "plans/index/" => "plans#index"
    # get ":id", to: "camp_sites#show", as: "show"
    # get ""
  end

  scope module: :user do
    root 'camp_sites#index'
    resources :camp_sites do
      # get 'get_plan_details', on: :collection
      resources :plans do
        resources :reservations, only: [:new, :create], module: :camp_site
      end
    end
    get "users" => "users#show"
    resources :plans do
      resources :reservations, only: [:new, :create]
      # get '/reservations/new', to: 'reservations#new', as: 'new_reservation'
    end
    resources :users, only: [:show, :create, :edit, :update] do
      member do
        get "quit"
        patch "withdraw"
      end
    end
    resources :reservations do
      collection do
        get :thanks
      end
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
