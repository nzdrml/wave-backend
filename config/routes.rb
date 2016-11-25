Rails.application.routes.draw do

  constraints :subdomain => 'admin' do
    root 'trips#index'

    resources :users do
      member do
        post 'top_up'
      end
    end

    resources :trips do
      member do
        get 'confirm'
        get 'cancel'
        get 'add_rider'
        get 'add_riders'
        get 'remove_rider'
      end

      collection do
        get 'upcoming'
      end
    end

    resources :routes
    resources :points
    resources :schedules
  end

end
