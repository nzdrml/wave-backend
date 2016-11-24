Rails.application.routes.draw do

  constraints :subdomain => 'admin' do
    root 'trips#index'
    resources :users
    resources :trips do
      member do
        get 'confirm'
        get 'cancel'
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
