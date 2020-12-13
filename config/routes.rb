Rails.application.routes.draw do

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'

  namespace :api do
    namespace :v1 do 
      resources :todos do
        resources :subtodos
      end
    end
  end

end
