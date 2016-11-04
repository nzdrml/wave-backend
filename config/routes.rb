Rails.application.routes.draw do

  constraints :subdomain => 'admin' do
    root 'trips#index'
    resources :users
    resources :trips
    resources :routes
    resources :points
  end

end
