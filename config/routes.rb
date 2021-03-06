Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  get "", to: "application#default_startup_screen"
  resources :users
  
  namespace :api do
    namespace :v1 do 
      resources :todos do
        resources :subtodos
      end
    end
  end

end
