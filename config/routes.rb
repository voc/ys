Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  root 'user_sessions#new'

  get 'login'  => "user_sessions#new",     as: :login
  get 'logout' => "user_sessions#destroy", as: :logout

  resources :sessions, controller: :user_sessions, only: [:create, :new, :destroy]

  resources :users do
    member do
      get :delete
    end

    resources :productions do
      member do
        get :delete
        get 'remove_logo'
      end

      resources :mount_points do
        member do
          get :delete
        end
      end
    end
  end

  resources :settings, only: [:show, :edit, :update] do
    get 'generate_api_key'
  end

end
