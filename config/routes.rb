Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  resources :users do
    member do
      get :confirm_email, to: 'confirmation#show'
    end
  end

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/dashboard', to: 'dashboard#show'

  
  namespace :api do
    namespace :v1 do
      resources :games do 
        post "/ships", to: "games/ships#create"
        post "/shots", to: "games/shots#create"
        end
      end 
    end
  
  namespace :api do
    namespace :v1 do
      get "/games", to: "games#index"
      post "/games", to: "games#show"
    end
  end
end


